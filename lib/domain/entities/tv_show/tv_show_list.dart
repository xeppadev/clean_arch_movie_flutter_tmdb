import 'package:equatable/equatable.dart';

import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_details.dart';

class TvShowListEntity extends Equatable {
  final int? page;
  final List<TvShowDetailsEntity>? tvShows;
  final int? totalPages;
  final int? totalResults;

  const TvShowListEntity({
    this.tvShows,
    this.page,
    this.totalPages,
    this.totalResults,
  });

  @override
  List<Object?> get props => [
        tvShows,
      ];
}
