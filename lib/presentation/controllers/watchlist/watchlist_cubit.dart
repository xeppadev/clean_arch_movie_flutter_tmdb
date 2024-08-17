import 'package:clean_arch_movie_flutter/domain/entities/watchlist/watchlist.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/watchlist/watchlist_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watchlist_state.dart';


class WatchlistCubit extends Cubit<WatchListState> {
  final WatchlistUsecases _watchlistUsecases;

  WatchlistCubit(this._watchlistUsecases) : super(WatchlistInitial());


  Future<void> getSavedWatchlist() async {
    try{
      if (state is WatchlistLoading) {
        emit(const WatchlistLoading());
      }
      final result = await _watchlistUsecases.getWatchlist();

      result.fold(
        (l) => emit(WatchListError(l.message)),
        (r) => emit(WatchListLoaded(r)),
      );

    } catch(_){
      rethrow;
    }
  }
}