import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode_details.dart';
import 'package:equatable/equatable.dart';

class SeasonDetailsEntity extends Equatable {
  final int? tmdbID;
  final String? name;
  final String? airDate;
  final String? overview;
  final String? posterUrl;
  final int? episodeCount;
  final int? seasonNumber;
  final List<EpisodeDetailEntity>? episodes;

  const SeasonDetailsEntity({
    required this.tmdbID,
    required this.name,
    required this.airDate,
    required this.episodeCount,
    required this.overview,
    required this.posterUrl,
    required this.seasonNumber,
    required this.episodes,
  });

  @override
  List<Object?> get props => [
        tmdbID,
        name,
        airDate,
        episodeCount,
        overview,
        posterUrl,
        seasonNumber,
        episodes,
      ];
}
