// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeDetailsModel _$EpisodeDetailsModelFromJson(Map<String, dynamic> json) =>
    EpisodeDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      number: (json['episode_number'] as num?)?.toInt(),
      season: (json['season_number'] as num?)?.toInt(),
      name: json['name'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      stillPath: json['still_path'] as String?,
      airDate: json['air_date'] as String?,
    );

Map<String, dynamic> _$EpisodeDetailsModelToJson(
        EpisodeDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'episode_number': instance.number,
      'season_number': instance.season,
      'name': instance.name,
      'runtime': instance.runtime,
      'still_path': instance.stillPath,
      'air_date': instance.airDate,
    };
