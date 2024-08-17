import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoUsecases _videoUsecases;

  VideoCubit(this._videoUsecases) : super(VideoInitial());
Future<void> getVideo(int id, bool isMovie) async {
  if (isClosed) return; // Verificar si el Cubit ya está cerrado

  try {
    emit(VideoLoading());

    final result = await _videoUsecases.getVideo(isMovie: isMovie, id: id);

    result.fold(
      (error) {
        if (!isClosed) emit(VideoError(message: error.message)); // Verificar si el Cubit está cerrado
      },
      (success) {
        if (!isClosed) emit(VideoLoaded(videoEntity: success)); // Verificar si el Cubit está cerrado
      },
    );
  } catch (e) {
    if (!isClosed) emit(VideoError(message: e.toString())); // Manejar excepciones también
  }
}
}