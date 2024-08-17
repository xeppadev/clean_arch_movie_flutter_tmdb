// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      posterUrl: json['poster_path'] as String?,
      isMovie: SearchModel._isMovieFromJson(json['media_type'] as String?),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterUrl,
      'media_type': instance.isMovie,
      'vote_average': instance.voteAverage,
    };
