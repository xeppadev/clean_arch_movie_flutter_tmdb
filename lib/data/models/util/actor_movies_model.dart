import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/data/models/movies/movie_details_model.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/actor_movies.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'actor_movies_model.g.dart';

@JsonSerializable()
class ActorMovieModel extends Equatable with EntityConvertible<ActorMovieModel, ActorMovieEntity>{
  final int? id;
  @JsonKey(name: 'cast')
  final List<MovieDetailsModel>? movies;

  const ActorMovieModel({
    this.id,
    this.movies,
  });

  factory ActorMovieModel.fromJson(Map<String, dynamic> json) => _$ActorMovieModelFromJson(json);

  @override
  ActorMovieEntity toEntity() {
    return ActorMovieEntity(
      id: id,
      movies: movies?.map((e) => e.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() => _$ActorMovieModelToJson(this);

  @override
  List<Object?> get props => [id, movies];
}