import 'package:clean_arch_movie_flutter/domain/entities/util/actor.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/actor_movies.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast_list.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/util/util_repository.dart';
import 'package:clean_arch_movie_flutter/data/datasources/export_datasources.dart';

class UtilRepositoryImpl implements UtilRepository {
  final UtilRemoteDataSource _remoteDataSource;

  UtilRepositoryImpl(this._remoteDataSource);

  // Remote

  @override
  Future<Either<NetworkException, CastListEntity>> getCast(
      {required int id}) async {
    try {
      final result = await _remoteDataSource.getCast(id: id);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetails(
      {required int id}) async {
    try {
      final result = await _remoteDataSource.getActorDetails(id: id);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, ActorMovieEntity>> getActorMovies(
      {required int id}) async {
    try {
      final result = await _remoteDataSource.getActorMovies(id: id);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
}
