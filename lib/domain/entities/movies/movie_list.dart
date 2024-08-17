import 'package:clean_arch_movie_flutter/domain/entities/movies/movie_details.dart';
import 'package:equatable/equatable.dart';

class MovieListEntity extends Equatable {
  final int? page;
  final List<MovieDetailsEntity>? movies;
  final int? totalPages;
  final int? totalResults;

  const MovieListEntity({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  @override
  List<Object?> get props => [page, movies, totalPages, totalResults];
}
