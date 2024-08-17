// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerosModel _$GenerosModelFromJson(Map<String, dynamic> json) => GenerosModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenerosModelToJson(GenerosModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
