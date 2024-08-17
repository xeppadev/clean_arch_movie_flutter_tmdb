import 'package:clean_arch_movie_flutter/core/components/carrousell/carrousell_card.dart';
import 'package:clean_arch_movie_flutter/core/components/carrousell/section_listview_card.dart';
import 'package:clean_arch_movie_flutter/core/components/header/header_title.dart';
import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/popular_tv_show/popular_tv_show_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/top_rated_tv_show/top_rated_tv_show_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:clean_arch_movie_flutter/core/components/slider/slider_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TvShowView extends StatelessWidget {
  const TvShowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<PopularTvShowCubit, PopularTvShowState>(
            listener: (context, state) {
              if (state is PopularTvShowError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
          BlocListener<TopRatedTvShowCubit, TopRatedTvShowState>(
            listener: (context, state) {
              if (state is TopRatedTvShowError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<PopularTvShowCubit, PopularTvShowState>(
          builder: (context, popularState) {
            return BlocBuilder<TopRatedTvShowCubit, TopRatedTvShowState>(
              builder: (context, topRatedState) {
                if (popularState is PopularTvShowLoading ||
                    topRatedState is TopRatedTvShowLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (popularState is PopularTvShowLoaded &&
                    topRatedState is TopRatedTvShowLoaded) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SliderCard(
                          isMovie: false,
                          list: popularState.tvshows,
                          index: 0,
                        ),
                        HeaderTitle(
                          title: 'Popular TV Shows',
                          onTap: () {
                            navigateToSectionView(context, 'Popular', 'tv_show',
                                popularState.tvshows);
                          },
                        ),
                        CarrousellCard(
                          height: 250,
                          itemCount: popularState.tvshows.length,
                          itemBuilder: (context, index) {
                            return SectionListViewCard(
                              isMovie: false,
                              media: popularState.tvshows[index],
                            );
                          },
                        ),
                        HeaderTitle(
                          title: 'Top Rated TV Shows',
                          onTap: () {
                            navigateToSectionView(
                              context,
                              'Top Rated',
                              'tv_show',
                              topRatedState.tvshows,
                            );
                          },
                        ),
                        CarrousellCard(
                          height: 250,
                          itemCount: topRatedState.tvshows.length,
                          itemBuilder: (context, index) {
                            return SectionListViewCard(
                              media: topRatedState.tvshows[index],
                              isMovie: false,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('An error occurred'),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
