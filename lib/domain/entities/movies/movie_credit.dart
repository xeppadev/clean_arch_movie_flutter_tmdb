import 'package:clean_arch_movie_flutter/domain/entities/util/cast.dart';
import 'package:equatable/equatable.dart';


class MovieCreditEntity extends Equatable {
  final int? id;
  final List<CastEntity>? cast;

  const MovieCreditEntity({
    this.id,
    this.cast,
  });

  @override
  List<Object?> get props => [id, cast];
}