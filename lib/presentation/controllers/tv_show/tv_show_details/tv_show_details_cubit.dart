import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_details.dart';

part 'tv_show_details_state.dart';

class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  TvShowDetailsCubit(this._tvShowUsecases) : super(TvShowDetailsInitial());

  final TvShowUsecases _tvShowUsecases;

  Future<void> getTvShowDetails(int tvShowId) async {
    try {
      emit(const TvShowDetailsLoading());
      final result = await _tvShowUsecases.getTvShowDetails(tvShowId: tvShowId);

      result.fold(
        (error) {
          emit(TvShowDetailsError(message: error.message));
        },
        (success) {
          emit(TvShowDetailsLoaded(tvshow: success));
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
