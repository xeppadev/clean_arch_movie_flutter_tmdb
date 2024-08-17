import 'package:clean_arch_movie_flutter/data/models/tv_show/episode_details_model.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/season_details.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';

part 'season_details_model.g.dart';

@JsonSerializable()
class SeasonDetailsModel extends Equatable
    with EntityConvertible<SeasonDetailsModel, SeasonDetailsEntity> {
  @JsonKey(name: 'id')
  final int? tmdbID;
  final String? name;
  @JsonKey(name: 'air_date')
  final String? airDate;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterUrl;
  @JsonKey(name: 'episode_count')
  final int? episodeCount;
  @JsonKey(name: 'season_number')
  final int? seasonNumber;
  final List<EpisodeDetailsModel>? episodes;

  SeasonDetailsModel({
    required this.tmdbID,
    required this.name,
    required this.airDate,
    required this.overview,
    required this.episodeCount,
    required this.posterUrl,
    required this.seasonNumber,
    required this.episodes,
  });

  factory SeasonDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonDetailsModelToJson(this);

  @override
  List<Object?> get props => [
        tmdbID,
        name,
        airDate,
        overview,
        posterUrl,
        seasonNumber,
        episodes,
      ];

  @override
  SeasonDetailsEntity toEntity() => SeasonDetailsEntity(
        tmdbID: tmdbID,
        name: name,
        airDate: airDate,
        overview: overview,
        episodeCount: episodeCount,
        posterUrl: posterUrl,
        seasonNumber: seasonNumber,
        episodes: episodes?.map((e) => e.toEntity()).toList(),
      );
}
