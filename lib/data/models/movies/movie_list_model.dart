import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:clean_arch_movie_flutter/data/models/movies/movie_details_model.dart';
import 'package:clean_arch_movie_flutter/domain/entities/movies/movie_list.dart';
import 'package:equatable/equatable.dart';
part 'movie_list_model.g.dart';

@JsonSerializable()
class MovieListModel extends Equatable with EntityConvertible<MovieListModel, MovieListEntity> {
  final int? page;
  @JsonKey(name: 'results')
  final List<MovieDetailsModel>? movies;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  const MovieListModel({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    return _$MovieListModelFromJson(json);
  }

  @override
  MovieListEntity toEntity() => MovieListEntity(
        page: page,
        movies: movies?.map((e) => e.toEntity()).toList(),
        totalPages: totalPages,
        totalResults: totalResults,
      );
  Map<String, dynamic> toJson() => _$MovieListModelToJson(this);

  @override
  List<Object?> get props => [page, movies, totalPages, totalResults];
}