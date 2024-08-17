import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/tv_show/tv_show_repository.dart';
import 'package:clean_arch_movie_flutter/data/datasources/export_datasources.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final TvShowRemoteDataSource _remoteDataSource;

  TvShowRepositoryImpl(this._remoteDataSource);

  // Remote

  @override
  Future<Either<NetworkException, TvShowListEntity>> getTopRatedTvShows(
      {required int page}) async {
    try {
      final result = await _remoteDataSource.getTopRatedTvShows(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TvShowListEntity>> getPopularTvShows(
      {required int page}) async {
    try {
      final result = await _remoteDataSource.getPopularTvShows(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TvShowDetailsEntity>> getTvShowDetails(
      {required int tvShowId}) async {
    try {
      final result =
          await _remoteDataSource.getTvShowDetails(tvShowId: tvShowId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TvShowCreditEntity>> getTvShowCredit(
      {required int tvShowId}) async {
    try {
      final result =
          await _remoteDataSource.getTvShowCredit(tvShowId: tvShowId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TvShowListEntity>> getSimilarTvShows(
      {required int tvShowId, required int page}) async {
    try {
      final result = await _remoteDataSource.getSimilarTvShows(
          tvShowId: tvShowId, page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, SeasonDetailsEntity>> getSeasonDetails(
      {required int tvShowId, required int seasonNumber}) async {
    try {
      final result = await _remoteDataSource.getSeasonDetails(
          tvShowId: tvShowId, seasonNumber: seasonNumber);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, EpisodeDetailEntity>> getEpisodeDetails(
      {required int tvShowId,
      required int seasonNumber,
      required int episodeNumber}) async {
    try {
      final result = await _remoteDataSource.getEpisodeDetails(
          tvShowId: tvShowId,
          seasonNumber: seasonNumber,
          episodeNumber: episodeNumber);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
}
