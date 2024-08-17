import 'package:clean_arch_movie_flutter/core/components/section_media/section_media.dart';
import 'package:clean_arch_movie_flutter/core/components/section_media/section_media_list.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/popular_tv_show/popular_tv_show_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TvShowPopularView extends StatelessWidget {
  final List<dynamic> listData;
  const TvShowPopularView({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    //Accedo al cubit padre
    final popularTvShowCubit = context.read<PopularTvShowCubit>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Popular Tv Shows',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          toolbarHeight: 40,
          leading:
              IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () { Navigator.of(context).pop();},),
        ),
        body: BlocBuilder<PopularTvShowCubit, PopularTvShowState>(
            bloc: popularTvShowCubit,
            builder: (context, state) {
              if (state is PopularTvShowLoaded) {
                return SectionMediaList(
                    itemCount: state.tvshows.length,
                    itemBuilder: (context, index) {
                      if (index < state.tvshows.length) {
                        return SectionCard(
                            media: state.tvshows[index], isMovie: false);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                    addEvent: () {
                      popularTvShowCubit.fetchMoreTvShows();
                    });
              } else if (state is PopularTvShowLoading) {
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
