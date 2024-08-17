import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:fpdart/fpdart.dart';

abstract class VideoRepository {
  //Remote Data
  Future<Either<NetworkException, VideoEntity>> getVideo({required bool isMovie, required int id});
}