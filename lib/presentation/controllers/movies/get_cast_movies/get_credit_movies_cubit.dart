import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';

part 'get_credit_movies_state.dart';

class GetCreditMoviesCubit extends Cubit<GetCreditMoviesState> {
  final MoviesUsecases _moviesUsecases;

  GetCreditMoviesCubit(this._moviesUsecases)
      : super(const GetCreditMoviesState());

  Future<void> getCastMovies(int movieId) async {
    try {
      emit(const GetCreditMoviesLoading());
      final result = await _moviesUsecases.getMovieCredits(movieId: movieId);
      result.fold(
        (error) {
          emit(GetCreditMoviesError(message: error.message));
        },
        (success) {
          emit(GetCreditMoviesLoaded(castMovies: success));
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
