import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:fpdart/fpdart.dart';

abstract class MovieRepository {
  //Data Remota
  // Get top rated movies
  Future<Either<NetworkException, MovieListEntity>> getTopRatedMovies(
      {required int page});

  // Get popular movies
  Future<Either<NetworkException, MovieListEntity>> getPopularMovies(
      {required int page});

  // Get details of a movie
  Future<Either<NetworkException, MovieDetailsEntity>> getMovieDetails(
      {required int movieId});

  Future<Either<NetworkException, MovieCreditEntity>> getMovieCredits(
      {required int movieId});

  // Get similar movies
  Future<Either<NetworkException, MovieListEntity>> getSimilarMovies(
      {required int movieId, required int page});
}
