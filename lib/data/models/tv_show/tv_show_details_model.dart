import 'package:clean_arch_movie_flutter/data/models/tv_show/episode_details_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/season_details_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_details.dart';

part 'tv_show_details_model.g.dart';

@JsonSerializable()
class TvShowDetailsModel extends Equatable
    with EntityConvertible<TvShowDetailsModel, TvShowDetailsEntity> {
  final int? id;
  @JsonKey(name: 'name')
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterUrl;
  @JsonKey(name: 'backdrop_path')
  final String? backdropUrl;
  @JsonKey(name: 'first_air_date')
  final String? releaseDate;

  @JsonKey(name: 'number_of_seasons')
  final int? numberOfSeasons;
  final String? overview;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'last_episode_to_air')
  final EpisodeDetailsModel? lastEpisodeToAir;
  final List<SeasonDetailsModel>? seasons;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @JsonKey(name: 'trailer_url')
  final String? trailerUrl;

  TvShowDetailsModel({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.releaseDate,
    required this.numberOfSeasons,
    required this.overview,
    required this.voteAverage,
    required this.lastEpisodeToAir,
    required this.voteCount,
    required this.trailerUrl,
    required this.seasons,
  });

  factory TvShowDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowDetailsModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        title,
        posterUrl,
        backdropUrl,
        releaseDate,
        numberOfSeasons,
        overview,
        voteAverage,
        lastEpisodeToAir,
        voteCount,
        trailerUrl,
        seasons,
      ];

  Map<String, dynamic> toJson() => _$TvShowDetailsModelToJson(this);

  @override
  TvShowDetailsEntity toEntity() => TvShowDetailsEntity(
        id: id,
        title: title,
        posterUrl: posterUrl,
        backdropUrl: backdropUrl,
        releaseDate: releaseDate,
        numberOfSeasons: numberOfSeasons,
        overview: overview,
        voteAverage: voteAverage,
        lastEpisodeToAir: lastEpisodeToAir?.toEntity(),
        voteCount: voteCount,
        trailerUrl: trailerUrl,
        seasons: seasons?.map((e) => e.toEntity()).toList(),
      );
}
