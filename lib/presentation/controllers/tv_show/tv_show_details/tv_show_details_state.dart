part of 'tv_show_details_cubit.dart';

class TvShowDetailsState extends Equatable {
  const TvShowDetailsState();

  @override
  List<Object> get props => [];
}

final class TvShowDetailsInitial extends TvShowDetailsState {}

final class TvShowDetailsLoading extends TvShowDetailsState {
  const TvShowDetailsLoading();
}

final class TvShowDetailsLoaded extends TvShowDetailsState {
  const TvShowDetailsLoaded({required this.tvshow});
  final TvShowDetailsEntity tvshow;

  @override
  List<Object> get props => [tvshow];
}

final class TvShowDetailsError extends TvShowDetailsState {
  const TvShowDetailsError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
