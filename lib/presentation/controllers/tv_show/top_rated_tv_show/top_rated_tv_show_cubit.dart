import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_details.dart';

part 'top_rated_tv_show_state.dart';

class TopRatedTvShowCubit extends Cubit<TopRatedTvShowState> {
  TopRatedTvShowCubit(this._movieUsecases) : super(TopRatedTvShowInitial());

  final TvShowUsecases _movieUsecases;
  final List<TvShowDetailsEntity> _movieList = [];
  int _page = 1;
  bool hasReachedMax = false;

  Future<void> getTopRatedTvShow() async {
    try {
      if (hasReachedMax) return;

      if (state is! TopRatedTvShowLoaded) {
        emit(const TopRatedTvShowLoading());
      }

      final result = await _movieUsecases.getTopRatedTvShows(page: _page);

      result.fold(
        (error) {
          emit(TopRatedTvShowError(message: error.message));
        },
        (success) {
          _page++;
          _movieList.addAll(success.tvShows
                  ?.where((movie) => _movieList.contains(movie) == false) ??
              []);

          if ((success.tvShows?.length ?? 0) < 20) {
            hasReachedMax = true;
          }

          emit(TopRatedTvShowLoaded(tvshows: List.of(_movieList)));
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchMoreTopTvShows() async {
    try {
      if (hasReachedMax) return;

      final result = await _movieUsecases.getTopRatedTvShows(page: _page);

      result.fold(
        (error) {
          emit(TopRatedTvShowError(message: error.message));
        },
        (success) {
          _page++;
          _movieList.addAll(success.tvShows
                  ?.where((movie) => _movieList.contains(movie) == false) ??
              []);

          if ((success.tvShows?.length ?? 0) < 20) {
            hasReachedMax = true;
          }

          emit(TopRatedTvShowLoaded(tvshows: List.of(_movieList)));
        },
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
