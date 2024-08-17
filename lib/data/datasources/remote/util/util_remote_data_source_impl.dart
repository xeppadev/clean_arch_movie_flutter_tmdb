import 'package:clean_arch_movie_flutter/core/constants/url_constants.dart';
import 'package:clean_arch_movie_flutter/core/network/dio_client.dart';
import 'package:clean_arch_movie_flutter/data/datasources/remote/util/util_remote_data_source.dart';
import 'package:clean_arch_movie_flutter/data/models/util/actor_model.dart';
import 'package:clean_arch_movie_flutter/data/models/util/actor_movies_model.dart';
import 'package:clean_arch_movie_flutter/data/models/util/cast_list_model.dart';

class UtilRemoteDataSourceImpl implements UtilRemoteDataSource {
  final DioClient _dioClient;

  const UtilRemoteDataSourceImpl(this._dioClient);

  @override
  Future<CastListModel> getCast({required int id}) async {
    try {
      final response = await _dioClient
          .get(UrlConstants.movieCredits.replaceAll('movie_id', id.toString()));

      final model = CastListModel.fromJson(response.data as List<dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<ActorDetailModel> getActorDetails({required int id}) async {
    try {
      final response = await _dioClient.get(
          UrlConstants.actorDetails.replaceAll('{person_id}', id.toString()));

      final model =
          ActorDetailModel.fromJson(response.data as Map<String, dynamic>);
      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<ActorMovieModel> getActorMovies({required int id}) async {
    try {
      final response = await _dioClient.get(
          UrlConstants.actorMovies.replaceAll('{person_id}', id.toString()));

      final model =
          ActorMovieModel.fromJson(response.data as Map<String, dynamic>);
      return model;
    } catch (_) {
      rethrow;
    }
  }
}
