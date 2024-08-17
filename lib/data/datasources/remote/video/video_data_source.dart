import 'package:clean_arch_movie_flutter/data/models/video/video_model.dart';

abstract class VideoRemoteDataSource {
  // Devuelve una lista de videos de la fuente de datos remota.
  Future<VideoModel> getVideo({required bool isMovie, required int id});
}