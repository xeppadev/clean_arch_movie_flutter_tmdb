// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorMovieModel _$ActorMovieModelFromJson(Map<String, dynamic> json) =>
    ActorMovieModel(
      id: (json['id'] as num?)?.toInt(),
      movies: (json['cast'] as List<dynamic>?)
          ?.map((e) => MovieDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActorMovieModelToJson(ActorMovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.movies,
    };
