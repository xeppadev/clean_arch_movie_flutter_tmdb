import 'package:clean_arch_movie_flutter/domain/entities/util/cast.dart';
import 'package:equatable/equatable.dart';

class CastListEntity extends Equatable {
  final List<CastEntity> cast;

  const CastListEntity({
    required this.cast,
  });

  @override
  List<Object?> get props => [cast];
}
