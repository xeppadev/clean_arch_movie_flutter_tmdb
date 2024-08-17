import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast_model.g.dart';

@JsonSerializable()
class CastModel extends Equatable
    with EntityConvertible<CastModel, CastEntity> {
  final int? id;
  final String? name;
  @JsonKey(name: 'profile_path')
  final String? profileUrl;
  final int? gender;

  const CastModel({
    required this.id,
    required this.name,
    required this.profileUrl,
    required this.gender,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return _$CastModelFromJson(json);
  }

  @override
  CastEntity toEntity() => CastEntity(
        id: id,
        name: name,
        profileUrl: profileUrl,
        gender: gender,
      );

  Map<String, dynamic> toJson() => _$CastModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        profileUrl,
        gender,
        id,
      ];
}
