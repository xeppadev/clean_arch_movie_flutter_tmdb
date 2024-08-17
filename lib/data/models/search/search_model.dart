import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/search/search.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_model.g.dart';

@JsonSerializable()
class SearchModel extends Equatable with EntityConvertible<SearchModel, SearchEntity> {
  final int? id;
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterUrl;
  @JsonKey(name: 'media_type', fromJson: _isMovieFromJson)
  final bool? isMovie;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  const SearchModel({
    this.id,
    this.title,
    this.posterUrl,
    this.isMovie,
    this.voteAverage,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    // Extrae 'title' o 'name' del JSON
    final title = json['title'] ?? json['name'];
    return SearchModel(
      id: json['id'],
      title: title,
      posterUrl: json['poster_path'],
      isMovie: json['media_type'] == 'movie',
      voteAverage: json['vote_average'],
    );
  }

  @override
  SearchEntity toEntity() => SearchEntity(
        id: id,
        title: title,
        posterUrl: posterUrl,
        isMovie: isMovie,
        voteAverage: voteAverage,
      );
  
  Map<String, dynamic> toJson() => _$SearchModelToJson(this);

  @override
  List<Object?> get props => [id, title, posterUrl, isMovie, voteAverage];

  static bool? _isMovieFromJson(String? mediaType) {
    if (mediaType == null) return null;
    return mediaType == 'movie';
  }
}
