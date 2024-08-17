import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:equatable/equatable.dart';

class TvShowDetailsEntity extends Equatable {
  final int? id;
  final String? title;
  final String? posterUrl;
  final String? backdropUrl;
  final String? releaseDate;

  final int? runtime;
  final int? numberOfSeasons;
  final String? overview;
  final double? voteAverage;
  final EpisodeDetailEntity? lastEpisodeToAir;
  final List<SeasonDetailsEntity>? seasons;
  final int? voteCount;
  final String? trailerUrl;

  const TvShowDetailsEntity({
    this.id,
    this.title,
    this.posterUrl,
    this.backdropUrl,
    this.releaseDate,
    this.runtime,
    this.numberOfSeasons,
    this.overview,
    this.voteAverage,
    this.lastEpisodeToAir,
    this.voteCount,
    this.trailerUrl,
    this.seasons,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterUrl,
        backdropUrl,
        releaseDate,
        runtime,
        numberOfSeasons,
        overview,
        voteAverage,
        lastEpisodeToAir,
        voteCount,
        trailerUrl,
        seasons,
      ];
}
