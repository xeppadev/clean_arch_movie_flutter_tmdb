import 'package:clean_arch_movie_flutter/data/datasources/export_datasources.dart';
import 'package:clean_arch_movie_flutter/core/constants/url_constants.dart';
import 'package:clean_arch_movie_flutter/core/network/dio_client.dart';
import 'package:clean_arch_movie_flutter/data/models/video/video_model.dart';

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  final DioClient _dioClient;

  const VideoRemoteDataSourceImpl(this._dioClient);

  @override
  Future<VideoModel> getVideo({required bool isMovie, required int id}) async {
    try {
      if (isMovie) {
        final response = await _dioClient.get(
            UrlConstants.movieVideos.replaceAll('{movie_id}', id.toString()), queryParameters: {'language': 'es-MX'});

        final modelV =
            VideoModel.fromJson(response.data as Map<String, dynamic>);
        return modelV;
      } else if (!isMovie) {
        final response = await _dioClient.get(
            UrlConstants.tvShowVideos.replaceAll('{series_id}', id.toString()), queryParameters: {'language': 'es-MX'});

        final modelV =
            VideoModel.fromJson(response.data as Map<String, dynamic>);
        return modelV;
      } else {
        throw Exception();
      }
    } catch (_) {
      rethrow;
    }
  }
}
