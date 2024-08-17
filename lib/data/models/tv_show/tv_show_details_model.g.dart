// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowDetailsModel _$TvShowDetailsModelFromJson(Map<String, dynamic> json) =>
    TvShowDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['name'] as String?,
      posterUrl: json['poster_path'] as String?,
      backdropUrl: json['backdrop_path'] as String?,
      releaseDate: json['first_air_date'] as String?,
      numberOfSeasons: (json['number_of_seasons'] as num?)?.toInt(),
      overview: json['overview'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      lastEpisodeToAir: json['last_episode_to_air'] == null
          ? null
          : EpisodeDetailsModel.fromJson(
              json['last_episode_to_air'] as Map<String, dynamic>),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      trailerUrl: json['trailer_url'] as String?,
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => SeasonDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvShowDetailsModelToJson(TvShowDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'poster_path': instance.posterUrl,
      'backdrop_path': instance.backdropUrl,
      'first_air_date': instance.releaseDate,
      'number_of_seasons': instance.numberOfSeasons,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'last_episode_to_air': instance.lastEpisodeToAir,
      'seasons': instance.seasons,
      'vote_count': instance.voteCount,
      'trailer_url': instance.trailerUrl,
    };
