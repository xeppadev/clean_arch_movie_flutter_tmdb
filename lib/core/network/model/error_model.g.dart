// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkErrorModel _$NetworkErrorModelFromJson(Map<String, dynamic> json) =>
    NetworkErrorModel(
      (json['status_code'] as num?)?.toInt(),
      json['status_message'] as String?,
    );

Map<String, dynamic> _$NetworkErrorModelToJson(NetworkErrorModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
