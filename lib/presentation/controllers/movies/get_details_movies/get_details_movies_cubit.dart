import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';

part 'get_details_movies_state.dart';

class GetDetailsMoviesCubit extends Cubit<GetDetailsMoviesState> {
  final MoviesUsecases _moviesUsecases;

  GetDetailsMoviesCubit(this._moviesUsecases)
      : super(GetDetailsMoviesInitial());

  Future<void> getDetailsMovies(int movieId) async {
    try {
      emit(const GetDetailsMoviesLoading());
      final result = await _moviesUsecases.getMovieDetails(movieId: movieId);
      result.fold(
        (error) {
          emit(GetDetailsMoviesError(message: error.message));
        },
        (success) {
          emit(GetDetailsMoviesLoaded(movieDetails: success));
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
