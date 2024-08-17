import 'package:clean_arch_movie_flutter/data/models/movies/movie_credit_model.dart';
import 'package:clean_arch_movie_flutter/data/models/movies/movie_details_model.dart';
import 'package:clean_arch_movie_flutter/data/models/movies/movie_list_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieListModel> getTopRatedMovies({required int page});

  Future<MovieListModel> getPopularMovies({required int page});

  Future<MovieDetailsModel> getMovieDetails({required int movieId});

  Future<MovieCreditModel> getMovieCredits({required int movieId});

  Future<MovieListModel> getSimilarMovies(
      {required int movieId, required int page});
}
