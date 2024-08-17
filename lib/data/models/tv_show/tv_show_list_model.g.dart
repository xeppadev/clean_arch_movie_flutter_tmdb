// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowListModel _$TvShowListModelFromJson(Map<String, dynamic> json) =>
    TvShowListModel(
      page: (json['page'] as num?)?.toInt(),
      tvShows: (json['results'] as List<dynamic>?)
          ?.map((e) => TvShowDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TvShowListModelToJson(TvShowListModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.tvShows,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
