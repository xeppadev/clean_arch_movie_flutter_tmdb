import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/movies/movie_details.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel extends Equatable
    with EntityConvertible<MovieDetailsModel, MovieDetailsEntity> {
  final int? id;
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterUrl;
  @JsonKey(name: 'backdrop_path')
  final String? backdropUrl;
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  final int? runtime;
  final String? overview;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @JsonKey(name: 'trailer_url')
  final String? trailerUrl;

  const MovieDetailsModel({
    this.id,
    this.title,
    this.posterUrl,
    this.backdropUrl,
    this.releaseDate,
    this.runtime,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.trailerUrl,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailsModelFromJson(json);
  }

  @override
  MovieDetailsEntity toEntity() => MovieDetailsEntity(
        id: id,
        title: title,
        posterUrl: posterUrl,
        backdropUrl: backdropUrl,
        releaseDate: releaseDate,
        runtime: runtime,
        overview: overview,
        voteAverage: voteAverage,
        voteCount: voteCount,
        trailerUrl: trailerUrl,
      );
  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        posterUrl,
        backdropUrl,
        releaseDate,
        runtime,
        overview,
        voteAverage,
        voteCount,
        trailerUrl,
      ];
}
