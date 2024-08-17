import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/data/models/util/cast_model.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast_list.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cast_list_model.g.dart';

@JsonSerializable()
class CastListModel extends Equatable
    with EntityConvertible<CastListModel, CastListEntity> {
  final List<CastModel> cast;

  const CastListModel({
    required this.cast,
  });

  factory CastListModel.fromJson(List<dynamic> json) {
    return CastListModel(
      cast: json.map((e) => CastModel.fromJson(e)).toList(),
    );
  }
  List<dynamic> toJson() {
    return cast.map((e) => e.toJson()).toList();
  }

  @override
  List<Object?> get props => [cast];

  @override
  CastListEntity toEntity() => CastListEntity(
        cast: cast.map((e) => e.toEntity()).toList(),
      );
}
