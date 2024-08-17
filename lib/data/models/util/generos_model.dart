import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/generos.dart';

part 'generos_model.g.dart';

@JsonSerializable()
class GenerosModel extends Equatable
    with EntityConvertible<GenerosModel, GenerosEntity> {
  final int? id;
  final String? name;

  const GenerosModel({
    this.id,
    this.name,
  });

  factory GenerosModel.fromJson(Map<String, dynamic> json) {
    return _$GenerosModelFromJson(json);
  }

  @override
  GenerosEntity toEntity() => GenerosEntity(
        id: id,
        name: name,
      );
  Map<String, dynamic> toJson() => _$GenerosModelToJson(this);

  @override
  List<Object?> get props => [id, name];
}
