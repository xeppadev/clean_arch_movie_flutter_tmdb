import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_details.dart';

part 'popular_tv_show_state.dart';

class PopularTvShowCubit extends Cubit<PopularTvShowState> {
  final TvShowUsecases _tvShowUsecases;

  PopularTvShowCubit(this._tvShowUsecases) : super(PopularTvShowInitial());

  /// The list of popular movie details.
  final List<TvShowDetailsEntity> _tvshoList = [];

  /// The current page number for fetching popular movies.
  int _page = 1;

  /// A flag indicating whether the maximum number of movies has been reached.
  bool hasReachedMax = false;

  Future<void> getPopularTvShow() async {
    try {
      // Checks if the maximum limit has been reached.
      if (hasReachedMax) return;

      /// Checks if the current state is not [GetPopularMoviesLoaded].
      /// If it is not, emits a [GetPopularMoviesLoading] state.
      if (state is! PopularTvShowLoaded) {
        emit(const PopularTvShowLoading());
      }

      final result = await _tvShowUsecases.getPopularTvShows(page: _page);

      result.fold(
        (error) {
          emit(PopularTvShowError(message: error.message));
        },
        (success) {
          // Increases the page number and adds the movies from the [success] response to the movie list.
          // If a movie already exists in the movie list, it will not be added again.
          // If the number of movies in the [success] response is less than 20, sets [hasReachedMax] to true.
          // Emits a [GetPopularMoviesLoaded] state with the updated movie list.

          _page++;
          _tvshoList.addAll(success.tvShows
                  ?.where((movie) => _tvshoList.contains(movie) == false) ??
              []);

          /// Checks if the number of movies in the [success] response is less than 20.
          /// If so, sets [hasReachedMax] to true.
          if ((success.tvShows?.length ?? 0) < 20) {
            hasReachedMax = true;
          }

          emit(PopularTvShowLoaded(tvshows: List.of(_tvshoList)));
        },
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Fetches more popular tv show.
  Future<void> fetchMoreTvShows()async{
    try{
      if (hasReachedMax)return;
      final result = await _tvShowUsecases.getPopularTvShows(page: _page);

      result.fold(
        (error){
          emit(PopularTvShowError(message: error.message));
        },
        (success){
          _page++;
          _tvshoList.addAll(success.tvShows?.where((movie)=> _tvshoList.contains(movie)==false)??[]);

          if ((success.tvShows?.length ?? 0) < 20) {
            hasReachedMax = true;
          }
          emit(PopularTvShowLoaded(tvshows: List.of(_tvshoList)));
        }
      );
    } catch(e){
      print(e);
      rethrow;
    }
  }


}
