import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_popular_movies_state.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  
  final List<MovieDetailsEntity> _movieList = [];

  final MoviesUsecases _moviesUsecases;

  int _page = 1;

  bool hasReachedMax = false;

  GetPopularMoviesCubit(this._moviesUsecases) : super(GetPopularMoviesInitial());

  Future<void> getPopularMovies() async {
    try{
      if (hasReachedMax) return;

      if (state is! GetPopularMoviesLoaded) {
        emit(const GetPopularMoviesLoading());
      }
      final result = await _moviesUsecases.getPopularMovies(page: _page);

      result.fold(
        (error) {
          emit(GetPopularMoviesError(message: error.message));
        },
        (success) {
          _page++;
          _movieList.addAll(success.movies?.where((movie)=> _movieList.contains(movie)==false)??[]);
          if ((success.movies?.length ?? 0) < 20) {
          hasReachedMax = true;
          }
          emit(GetPopularMoviesLoaded(movies: List.of(_movieList)));
        }

        
      );

    } catch(e) {
      print(e);
      rethrow;
    }
  }

  Future<void> fetchMoreMovies() async{
    try{
      if (hasReachedMax) return;

      final result = await _moviesUsecases.getPopularMovies(page: _page);

      result.fold(
        (error) {
          emit(GetPopularMoviesError(message: error.message));
        },
        (success) {
          _page++;
          _movieList.addAll(success.movies?.where((movie)=> _movieList.contains(movie)==false)??[]);
          if ((success.movies?.length ?? 0) < 20) {
          hasReachedMax = true;
          }
          emit(GetPopularMoviesLoaded(movies: List.of(_movieList)));
        }

        
      );

    } catch(e) {
      print(e);
      rethrow;
    }
  }

}