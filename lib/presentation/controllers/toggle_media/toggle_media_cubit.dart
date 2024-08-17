import 'package:clean_arch_movie_flutter/domain/entities/watchlist/watchlist.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/watchlist/watchlist_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_media_state.dart';

class ToggleMediaCubit extends Cubit<ToggleMediaState> {
  final WatchlistUsecases _watchlistUsecases;

  ToggleMediaCubit(this._watchlistUsecases) : super(const ToggleMediaInitial());

  Future<void> toggleWatchList(
      {required WatchlistEntity watchlistEntity}) async {
    try {
      emit(const ToggleMediaLoading());

      final result = await _watchlistUsecases.toggleWatchlist(
          watchlistEntity: watchlistEntity);

      result.fold(
        (l) => emit(ToggleMediaError(l.message)),
        (r) => emit(const ToggleMediaSuccess()),
      );
    } catch (_) {
      rethrow;
    }
  }
}
