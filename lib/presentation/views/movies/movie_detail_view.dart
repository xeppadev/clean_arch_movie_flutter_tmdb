import 'package:clean_arch_movie_flutter/core/components/details/details_card.dart';
import 'package:clean_arch_movie_flutter/core/components/details/movie_description_detail.dart';
import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_cast_movies/get_credit_movies_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_details_movies/get_details_movies_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_similar_movies/get_similar_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MovieDetailView extends StatefulWidget {
  final int movieId;
  const MovieDetailView(
      {super.key, @PathParam('movieId') required this.movieId});

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  late GetCreditMoviesCubit _movieCreditCubit;
  late GetDetailsMoviesCubit _movieDetailsCubit;
  late GetSimilarMoviesCubit _similarMoviesCubit;

  @override
  void initState() {
    super.initState();
    _movieCreditCubit = GetIt.I<GetCreditMoviesCubit>();
    _movieDetailsCubit = GetIt.I<GetDetailsMoviesCubit>();
    _similarMoviesCubit = GetIt.I<GetSimilarMoviesCubit>();
    _fetchData();
  }

  @override
  void didUpdateWidget(covariant MovieDetailView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.movieId != widget.movieId) {
      _fetchData();
    }
  }

  void _fetchData() {
    _movieCreditCubit.getCastMovies(widget.movieId);
    _movieDetailsCubit.getDetailsMovies(widget.movieId);
    _similarMoviesCubit.getSimilarMovies(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<GetCreditMoviesCubit>.value(value: _movieCreditCubit),
        BlocProvider<GetDetailsMoviesCubit>.value(value: _movieDetailsCubit),
        BlocProvider<GetSimilarMoviesCubit>.value(value: _similarMoviesCubit),
      ],
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
            BlocListener<GetCreditMoviesCubit, GetCreditMoviesState>(
              listener: (context, state) {
                if (state is GetCreditMoviesError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
            ),
            BlocListener<GetDetailsMoviesCubit, GetDetailsMoviesState>(
              listener: (context, state) {
                if (state is GetDetailsMoviesError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
            ),
            BlocListener<GetSimilarMoviesCubit, GetSimilarMoviesState>(
              listener: (context, state) {
                if (state is GetSimilarMoviesError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<GetDetailsMoviesCubit, GetDetailsMoviesState>(
            builder: (context, state) {
              return BlocBuilder<GetCreditMoviesCubit, GetCreditMoviesState>(
                builder: (context, creditState) {
                  return BlocBuilder<GetSimilarMoviesCubit,
                      GetSimilarMoviesState>(
                    builder: (context, similarState) {
                      if (state is GetDetailsMoviesLoading ||
                          creditState is GetCreditMoviesLoading ||
                          similarState is GetSimilarMoviesLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GetDetailsMoviesLoaded &&
                          creditState is GetCreditMoviesLoaded &&
                          similarState is GetSimilarMoviesLoaded) {
                        return MovieDetailsWidget(
                            movieDetails: state.movieDetails,
                            movieCredit: creditState.castMovies,
                            similarMovies: similarState.movies);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget(
      {super.key,
      required this.movieDetails,
      required this.movieCredit,
      required this.similarMovies});

  final MovieDetailsEntity movieDetails;
  final MovieCreditEntity movieCredit;
  final List<MovieDetailsEntity> similarMovies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        DetailsCard(
            typeMedia: 'movie',
            mediaDetails: movieDetails,
            detailsCard: MovieDescriptionDetail(
              movieDetails: movieDetails,
            )),

        // Add more details card here
        buildOverSection(movieDetails.overview),
        castList(movieCredit.cast),
        similarSection(similarMovies, true),
        // const SizedBox(height: 18),
      ]),
    ));
  }
}
