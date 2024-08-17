// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowCreditModel _$TvShowCreditModelFromJson(Map<String, dynamic> json) =>
    TvShowCreditModel(
      id: (json['id'] as num?)?.toInt(),
      cast: json['cast'] == null
          ? null
          : CastListModel.fromJson(json['cast'] as List<dynamic>),
    );

Map<String, dynamic> _$TvShowCreditModelToJson(TvShowCreditModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
