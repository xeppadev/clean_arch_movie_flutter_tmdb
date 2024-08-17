part of 'tv_show_season_details_cubit.dart';

class TvShowSeasonDetailsState extends Equatable {
  const TvShowSeasonDetailsState();

  @override
  List<Object> get props => [];
}

class TvShowSeasonDetailsInitial extends TvShowSeasonDetailsState {}

class TvShowSeasonDetailsLoading extends TvShowSeasonDetailsState {}

class TvShowSeasonDetailsError extends TvShowSeasonDetailsState {
  final String message;

  const TvShowSeasonDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}

class TvShowSeasonDetailsLoaded extends TvShowSeasonDetailsState {
  final SeasonDetailsEntity detailsEntity;

  const TvShowSeasonDetailsLoaded({required this.detailsEntity});

  @override
  List<Object> get props => [detailsEntity];
}
