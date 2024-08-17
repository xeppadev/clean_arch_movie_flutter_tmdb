part of 'tv_show_credit_cubit.dart';

sealed class TvShowCreditsState extends Equatable {
  const TvShowCreditsState();

  @override
  List<Object> get props => [];
}

final class TvShowCreditsInitial extends TvShowCreditsState {}

final class TvShowCreditsLoading extends TvShowCreditsState {
  const TvShowCreditsLoading();
}

final class TvShowCreditsLoaded extends TvShowCreditsState {
  const TvShowCreditsLoaded({required this.tvshow});
  final TvShowCreditEntity tvshow;

  @override
  List<Object> get props => [tvshow];
}

final class TvShowCreditsError extends TvShowCreditsState {
  const TvShowCreditsError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
