import 'package:clean_arch_movie_flutter/domain/repositories/util/util_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';

class UtilUsecases {
  final UtilRepository _repository;

  UtilUsecases(this._repository);

  // Remote
  Future<Either<NetworkException, CastListEntity>> getCast(
      {required int id}) async {
    return _repository.getCast(id: id);
  }

  Future<Either<NetworkException, ActorDetailEntity>> getActorDetails(
      {required int id}) async {
    return _repository.getActorDetails(id: id);
  }

  Future<Either<NetworkException, ActorMovieEntity>> getActorMovies(
      {required int id}) async {
    return _repository.getActorMovies(id: id);
  }
}
