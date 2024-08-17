import 'package:clean_arch_movie_flutter/core/components/section_media/section_media.dart';
import 'package:clean_arch_movie_flutter/core/components/section_media/section_media_list.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_top_rated_movies/get_top_rated_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MovieTopRatedView extends StatelessWidget {
  final List<dynamic> listData;
  const MovieTopRatedView({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    final getTopRatedMoviesCubit = context.read<GetTopRatedMoviesCubit>();

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
      body: BlocBuilder<GetTopRatedMoviesCubit, GetTopRatedMoviesState>(
        bloc: getTopRatedMoviesCubit,
        builder: (context, state) {
          if (state is GetTopRatedMoviesLoaded){
            return SectionMediaList(
              itemCount: state.movies.length, 
              itemBuilder: (context, index){
                if (index <state.movies.length){
                  return SectionCard(
                    media: state.movies[index], isMovie: true
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              addEvent: () {
                getTopRatedMoviesCubit.fetchMoreTopMovies();
              }
            );
          } else if (state is GetTopRatedMoviesLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        }
      )
    );
  }
}
