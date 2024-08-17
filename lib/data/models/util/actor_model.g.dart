// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorDetailModel _$ActorDetailModelFromJson(Map<String, dynamic> json) =>
    ActorDetailModel(
      name: json['name'] as String?,
      profileUrl: json['profile_path'] as String?,
      birthday: json['birthday'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ActorDetailModelToJson(ActorDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthday': instance.birthday,
      'profile_path': instance.profileUrl,
    };
