part of 'video_cubit.dart';

class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoError extends VideoState {
  final String message;

  const VideoError({required this.message});

  @override
  List<Object> get props => [message];
}

class VideoLoaded extends VideoState {
  final VideoEntity videoEntity;

  const VideoLoaded({required this.videoEntity});

  @override
  List<Object> get props => [videoEntity];
}