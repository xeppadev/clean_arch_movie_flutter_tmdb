import 'package:clean_arch_movie_flutter/data/models/util/cast_list_model.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_credit.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';

part 'tv_show_credit_model.g.dart';

@JsonSerializable()
class TvShowCreditModel extends Equatable
    with EntityConvertible<TvShowCreditModel, TvShowCreditEntity> {
  final int? id;
  @JsonKey(name: 'cast')
  final CastListModel? cast;

  TvShowCreditModel({
    required this.id,
    required this.cast,
  });

  factory TvShowCreditModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowCreditModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowCreditModelToJson(this);

  @override
  List<Object?> get props => [id, cast];

  @override
  TvShowCreditEntity toEntity() => TvShowCreditEntity(
        id: id,
        cast: cast?.toEntity(),
      );
}
