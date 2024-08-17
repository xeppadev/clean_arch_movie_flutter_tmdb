import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/actor.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'actor_model.g.dart';

@JsonSerializable()
class ActorDetailModel extends Equatable with EntityConvertible<ActorDetailModel, ActorDetailEntity> {
  final int? id;
  final String? name;
  final String? birthday;
  @JsonKey(name: 'profile_path')
  final String? profileUrl;


  const ActorDetailModel({
    this.name,
    this.profileUrl,
    this.birthday,
    this.id,
  });

  factory ActorDetailModel.fromJson(Map<String, dynamic> json) => _$ActorDetailModelFromJson(json);

  @override
  ActorDetailEntity toEntity() {
    return ActorDetailEntity(
      name: name,
      profileUrl: profileUrl,
      birthday: birthday,
      id: id,
    );
  }

  Map<String, dynamic> toJson() => _$ActorDetailModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        profileUrl,
        birthday,
        id,
      ];
}
