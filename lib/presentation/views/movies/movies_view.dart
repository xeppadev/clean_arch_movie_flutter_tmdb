import 'package:auto_route/annotations.dart';
import 'package:clean_arch_movie_flutter/core/components/carrousell/carrousell_card.dart';
import 'package:clean_arch_movie_flutter/core/components/carrousell/section_listview_card.dart';
import 'package:clean_arch_movie_flutter/core/components/header/header_title.dart';
import 'package:clean_arch_movie_flutter/core/components/slider/slider_card.dart';
import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_popular_movies/get_popular_movies_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_top_rated_movies/get_top_rated_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<GetPopularMoviesCubit, GetPopularMoviesState>(
            listener: (context, state) {
              if (state is GetPopularMoviesError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
          BlocListener<GetTopRatedMoviesCubit, GetTopRatedMoviesState>(
            listener: (context, state) {
              if (state is GetTopRatedMoviesError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<GetPopularMoviesCubit, GetPopularMoviesState>(
          builder: (context, popular1State) {
            return BlocBuilder<GetTopRatedMoviesCubit, GetTopRatedMoviesState>(
              builder: (context, topRated1State) {
                if (popular1State is GetPopularMoviesLoading ||
                    topRated1State is GetTopRatedMoviesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (popular1State is GetPopularMoviesLoaded &&
                    topRated1State is GetTopRatedMoviesLoaded) {
                  return SingleChildScrollView(
                      child: Column(
                    children: [
                      SliderCard(
                        isMovie: true,
                        list: popular1State.movies,
                        index: 0,
                      ),
                      HeaderTitle(
                        title: 'Popular Movies',
                        onTap: () {
                          navigateToSectionView(context, 'Popular', 'movie',
                              popular1State.movies);
                        },
                      ),
                      CarrousellCard(
                        height: 250,
                        itemCount: popular1State.movies.length,
                        itemBuilder: (context, index) {
                          return SectionListViewCard(
                            media: popular1State.movies[index],
                            isMovie: true,
                          );
                        },
                      ),
                      HeaderTitle(
                        title: 'Top Rated Movies',
                        onTap: () {
                          navigateToSectionView(context, 'Top Rated', 'movie',
                              topRated1State.movies);
                        },
                      ),
                      CarrousellCard(
                        height: 250,
                        itemCount: topRated1State.movies.length,
                        itemBuilder: (context, index) {
                          return SectionListViewCard(
                            media: topRated1State.movies[index],
                            isMovie: true,
                          );
                        },
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 65)),
                    ],
                  ));
                } else {
                  return const Center(
                    child: Text('Error'),
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
