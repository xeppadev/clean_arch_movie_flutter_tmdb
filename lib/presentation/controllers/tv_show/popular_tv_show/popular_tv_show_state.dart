part of 'popular_tv_show_cubit.dart';

sealed class PopularTvShowState extends Equatable {
  const PopularTvShowState();

  @override
  List<Object> get props => [];
}

final class PopularTvShowInitial extends PopularTvShowState {}

final class PopularTvShowLoading extends PopularTvShowState {
  const PopularTvShowLoading();
}

final class PopularTvShowLoaded extends PopularTvShowState {
  const PopularTvShowLoaded({required this.tvshows});

  final List<TvShowDetailsEntity> tvshows;

  @override
  List<Object> get props => [tvshows];
}

final class PopularTvShowError extends PopularTvShowState {
  const PopularTvShowError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
