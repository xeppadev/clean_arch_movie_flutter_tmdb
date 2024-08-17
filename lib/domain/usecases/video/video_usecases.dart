import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/video/video_repository.dart';
import 'package:fpdart/fpdart.dart';

class VideoUsecases{
  final VideoRepository _repository;

  VideoUsecases(this._repository);

  Future<Either<NetworkException, VideoEntity>> getVideo( {required bool isMovie, required int id}) async {
    return _repository.getVideo(isMovie: isMovie, id: id);
  }
}