import 'package:clean_arch_movie_flutter/data/models/util/actor_model.dart';
import 'package:clean_arch_movie_flutter/data/models/util/actor_movies_model.dart';
import 'package:clean_arch_movie_flutter/data/models/util/cast_list_model.dart';

abstract class UtilRemoteDataSource {
  //Data Remota
  // Get cast of a movie or tv show
  Future<CastListModel> getCast({required int id});

  // Get actor details
  Future<ActorDetailModel> getActorDetails({required int id});

  // Get actor movies
  Future<ActorMovieModel> getActorMovies({required int id});
}