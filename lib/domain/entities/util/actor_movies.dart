import 'package:clean_arch_movie_flutter/domain/entities/movies/movie_details.dart';
import 'package:equatable/equatable.dart';

class ActorMovieEntity extends Equatable {
  final int? id;
  final List<MovieDetailsEntity>? movies;

  const ActorMovieEntity({
    this.id,
    this.movies,
  });

  @override
  List<Object?> get props => [id, movies];
}