import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_top_rated_movies_state.dart';

class GetTopRatedMoviesCubit extends Cubit<GetTopRatedMoviesState> {
  final List<MovieDetailsEntity> _movieList = [];

  final MoviesUsecases _moviesUsecases;

  int _page = 1;

  bool hasReachedMax = false;

  GetTopRatedMoviesCubit(this._moviesUsecases)
      : super(GetTopRatedMoviesInitial());

  Future<void> getTopRatedMovies() async {
    try {
      if (hasReachedMax) return;

      if (state is! GetTopRatedMoviesLoaded) {
        emit(const GetTopRatedMoviesLoading());
      }
      final result = await _moviesUsecases.getTopRatedMovies(page: _page);

      result.fold((error) {
        emit(GetTopRatedMoviesError(message: error.message));
      }, (success) {
        _page++;
        _movieList.addAll(success.movies
                ?.where((movie) => _movieList.contains(movie) == false) ??
            []);
        if ((success.movies?.length ?? 0) < 20) {
          hasReachedMax = true;
        }
        emit(GetTopRatedMoviesLoaded(movies: List.of(_movieList)));
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchMoreTopMovies() async{
    try{
      if (hasReachedMax) return;
      final result = await _moviesUsecases.getTopRatedMovies(page: _page);

      result.fold(
        (error){
          emit(GetTopRatedMoviesError(message: error.message));
        },
        (success){
          _page++;
          _movieList.addAll(success.movies?.where((movie)=> _movieList.contains(movie)==false)??[]);
          if ((success.movies?.length ?? 0) < 20) {
          hasReachedMax = true;
          }
          emit(GetTopRatedMoviesLoaded(movies: List.of(_movieList)));
        }
      );
    } catch(e){
      print(e);
      rethrow;
    }	
  }

}

