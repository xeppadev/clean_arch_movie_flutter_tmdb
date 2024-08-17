import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_list.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/tv_show_details_model.dart';

part 'tv_show_list_model.g.dart';

@JsonSerializable()
class TvShowListModel extends Equatable
    with EntityConvertible<TvShowListModel, TvShowListEntity> {
  final int? page;
  @JsonKey(name: 'results')
  final List<TvShowDetailsModel>? tvShows;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  TvShowListModel({
    required this.page,
    required this.tvShows,
    required this.totalPages,
    required this.totalResults,
  });

  factory TvShowListModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowListModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowListModelToJson(this);

  @override
  List<Object?> get props => [page, tvShows, totalPages, totalResults];

  @override
  TvShowListEntity toEntity() => TvShowListEntity(
        page: page,
        tvShows: tvShows?.map((e) => e.toEntity()).toList(),
        totalPages: totalPages,
        totalResults: totalResults,
      );
}
