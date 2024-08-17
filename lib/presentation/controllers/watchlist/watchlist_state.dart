part of 'watchlist_cubit.dart';

sealed class WatchListState extends Equatable {
  const WatchListState();

  @override
  List<Object> get props => [];
}

final class WatchlistInitial extends WatchListState {}

final class WatchlistLoading extends WatchListState {
  const WatchlistLoading();
}

final class WatchListLoaded extends WatchListState{
  final List<WatchlistEntity> media;

  const WatchListLoaded(this.media);

  @override
  List<Object> get props => [media];
}

final class WatchListError extends WatchListState {
  final String message;

  const WatchListError(this.message);

  @override
  List<Object> get props => [message];
}