import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_credit.dart';

part 'tv_show_credit_state.dart';

class TvShowCreditCubit extends Cubit<TvShowCreditsState> {
  TvShowCreditCubit(this._tvShowUsecases) : super(TvShowCreditsInitial());

  final TvShowUsecases _tvShowUsecases;

  Future<void> getTvShowCredit(int tvShowId) async {
    try {
      emit(const TvShowCreditsLoading());
      final result = await _tvShowUsecases.getTvShowCredit(tvShowId: tvShowId);

      result.fold(
        (error) {
          emit(TvShowCreditsError(message: error.message));
        },
        (success) {
          emit(TvShowCreditsLoaded(tvshow: success));
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
