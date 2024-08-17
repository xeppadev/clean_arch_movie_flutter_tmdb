import 'package:bloc/bloc.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/season_details.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';

part 'tv_show_season_details_state.dart';

class TvShowSeasonDetailsCubit extends Cubit<TvShowSeasonDetailsState> {
  TvShowSeasonDetailsCubit(this._tvShowUsecases)
      : super(TvShowSeasonDetailsInitial());

  final TvShowUsecases _tvShowUsecases;

  Future<void> getSeasonDetails(int tvShowId, int seasonNumber) async {
    try {
      emit(TvShowSeasonDetailsLoading());
      final result = await _tvShowUsecases.getSeasonDetails(
          tvShowId: tvShowId, seasonNumber: seasonNumber);

      result.fold(
        (error) {
          emit(TvShowSeasonDetailsError(message: error.message));
        },
        (success) {
          emit(TvShowSeasonDetailsLoaded(detailsEntity: success));
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
