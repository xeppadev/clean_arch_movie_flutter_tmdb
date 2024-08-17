import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/actor.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/actor_movies.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast_list.dart';
import 'package:fpdart/fpdart.dart';

abstract class UtilRepository {
  //Data Remota
  // Get cast of a movie
  Future<Either<NetworkException, CastListEntity>> getCast({required int id});

  // Get actor details
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetails(
      {required int id});

  // Get actor movies
  Future<Either<NetworkException, ActorMovieEntity>> getActorMovies(
      {required int id});
}
