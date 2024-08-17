part of 'top_rated_tv_show_cubit.dart';

sealed class TopRatedTvShowState extends Equatable {
  const TopRatedTvShowState();

  @override
  List<Object> get props => [];
}

final class TopRatedTvShowInitial extends TopRatedTvShowState {}

final class TopRatedTvShowLoading extends TopRatedTvShowState {
  const TopRatedTvShowLoading();
}

final class TopRatedTvShowLoaded extends TopRatedTvShowState {
  const TopRatedTvShowLoaded({required this.tvshows});

  final List<TvShowDetailsEntity> tvshows;

  @override
  List<Object> get props => [tvshows];
}

final class TopRatedTvShowError extends TopRatedTvShowState {
  const TopRatedTvShowError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
