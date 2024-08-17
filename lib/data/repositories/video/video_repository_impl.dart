import 'package:clean_arch_movie_flutter/data/datasources/export_datasources.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/video/video_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoRemoteDataSource _remoteDataSource;

  VideoRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<NetworkException, VideoEntity>> getVideo({required bool isMovie, required int id}) async {
    try {
      final result = await _remoteDataSource.getVideo(isMovie: isMovie, id: id);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
}