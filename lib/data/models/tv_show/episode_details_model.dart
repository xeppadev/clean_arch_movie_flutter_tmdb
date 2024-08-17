import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode_details.dart';

part 'episode_details_model.g.dart';

@JsonSerializable()
class EpisodeDetailsModel extends Equatable
    with EntityConvertible<EpisodeDetailsModel, EpisodeDetailEntity> {
  final int? id;
  @JsonKey(name: 'episode_number')
  final int? number;
  @JsonKey(name: 'season_number')
  final int? season;
  final String? name;
  final int? runtime;
  @JsonKey(name: 'still_path')
  final String? stillPath;
  @JsonKey(name: 'air_date')
  final String? airDate;

  EpisodeDetailsModel({
    required this.id,
    required this.number,
    required this.season,
    required this.name,
    required this.runtime,
    required this.stillPath,
    required this.airDate,
  });

  factory EpisodeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeDetailsModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        number,
        season,
        name,
        runtime,
        stillPath,
        airDate,
      ];

  @override
  EpisodeDetailEntity toEntity() => EpisodeDetailEntity(
        id: id,
        number: number,
        season: season,
        name: name,
        runtime: runtime,
        stillPath: stillPath,
        airDate: airDate,
      );
}
