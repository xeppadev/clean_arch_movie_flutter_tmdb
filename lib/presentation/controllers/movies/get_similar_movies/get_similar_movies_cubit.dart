import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_similar_movies_state.dart';

class GetSimilarMoviesCubit extends Cubit<GetSimilarMoviesState> {
  final MoviesUsecases _moviesUsecases;

  final List<MovieDetailsEntity> _movieList = [];

  int _page = 1;

  bool hasReachedMax = false;

  GetSimilarMoviesCubit(this._moviesUsecases)
      : super(GetSimilarMoviesInitial());

  Future<void> getSimilarMovies(int movieId) async {
    try {
      if (hasReachedMax) return;

      if (state is! GetSimilarMoviesLoaded) {
        emit(const GetSimilarMoviesLoading());
      }

      final result =
          await _moviesUsecases.getSimilarMovies(movieId: movieId, page: _page);
      result.fold((error) {
        emit(GetSimilarMoviesError(message: error.message));
      }, (success) {
        _page++;
        _movieList.addAll(success.movies
                ?.where((movie) => _movieList.contains(movie) == false) ??
            []);

        if ((success.movies?.length ?? 0) < 20) {
          hasReachedMax = true;
        }

        emit(GetSimilarMoviesLoaded(movies: List.of(_movieList)));
      });
    } catch (e) {
      rethrow;
    }
  }
}
