import 'package:clean_arch_movie_flutter/core/components/section_media/section_media.dart';
import 'package:clean_arch_movie_flutter/core/components/section_media/section_media_list.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_popular_movies/get_popular_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MoviePopularView extends StatelessWidget {
  final List<dynamic> listData;
  const MoviePopularView({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    //Accedo al cubit padre
    final getPopularMoviesCubit = context.read<GetPopularMoviesCubit>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Popular Movies',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          toolbarHeight: 40,
          leading:
              IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () { Navigator.of(context).pop();},),
        ),
        body: BlocBuilder<GetPopularMoviesCubit, GetPopularMoviesState>(
            bloc: getPopularMoviesCubit,
            builder: (context, state) {
              if (state is GetPopularMoviesLoaded) {
                return SectionMediaList(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      if (index < state.movies.length) {
                        return SectionCard(
                            media: state.movies[index], isMovie: true);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                    addEvent: () {
                      getPopularMoviesCubit.fetchMoreMovies();
                    });
              } else if (state is GetPopularMoviesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            }));
  }
}
