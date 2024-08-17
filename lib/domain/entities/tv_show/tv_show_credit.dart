import 'package:equatable/equatable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast_list.dart';

class TvShowCreditEntity extends Equatable {
  final int? id;
  final CastListEntity? cast;

  const TvShowCreditEntity({
    this.id,
    this.cast,
  });

  @override
  List<Object?> get props => [
        id,
        cast,
      ];
}
