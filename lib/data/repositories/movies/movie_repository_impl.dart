import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/movies/movie_repository.dart';
import 'package:clean_arch_movie_flutter/data/datasources/export_datasources.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _remoteDataSource;

  MovieRepositoryImpl(this._remoteDataSource);

  // Remote

  @override
  Future<Either<NetworkException, MovieListEntity>> getTopRatedMovies(
      {required int page}) async {
    try {
      final result = await _remoteDataSource.getTopRatedMovies(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieListEntity>> getPopularMovies(
      {required int page}) async {
    try {
      final result = await _remoteDataSource.getPopularMovies(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieDetailsEntity>> getMovieDetails(
      {required int movieId}) async {
    try {
      final result = await _remoteDataSource.getMovieDetails(movieId: movieId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieCreditEntity>> getMovieCredits(
      {required int movieId}) async {
    try {
      final result = await _remoteDataSource.getMovieCredits(movieId: movieId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieListEntity>> getSimilarMovies(
      {required int movieId, required int page}) async {
    try {
      final result = await _remoteDataSource.getSimilarMovies(
          movieId: movieId, page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
}
