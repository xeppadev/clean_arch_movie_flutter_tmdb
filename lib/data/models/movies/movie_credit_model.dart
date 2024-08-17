import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/data/models/util/cast_model.dart';
import 'package:clean_arch_movie_flutter/domain/entities/movies/movie_credit.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_credit_model.g.dart';

@JsonSerializable()
class MovieCreditModel extends Equatable with EntityConvertible<MovieCreditModel, MovieCreditEntity> {
  final int? id;
  @JsonKey(name: 'cast')
  final List<CastModel>? cast;

  const MovieCreditModel({
    this.id,
    this.cast,
  });

  factory MovieCreditModel.fromJson(Map<String, dynamic> json) {
    return _$MovieCreditModelFromJson(json);
  }

  @override
  MovieCreditEntity toEntity() => MovieCreditEntity(
        id: id,
        cast: cast?.map((e) => e.toEntity()).toList(),
      );
  Map<String, dynamic> toJson() => _$MovieCreditModelToJson(this);
  
  @override
  List<Object?> get props => [id, cast];
}