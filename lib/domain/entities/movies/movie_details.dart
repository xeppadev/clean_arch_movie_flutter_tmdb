import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final int? id;
  final String? title;
  final String? posterUrl;
  final String? backdropUrl;
  final String? releaseDate;

  final int? runtime;
  final String? overview;
  final double? voteAverage;
  final int? voteCount;
  final String? trailerUrl;

  const MovieDetailsEntity({
    this.id,
    this.title,
    this.posterUrl,
    this.backdropUrl,
    this.releaseDate,
    this.runtime,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.trailerUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterUrl,
        backdropUrl,
        releaseDate,
        runtime,
        overview,
        voteAverage,
        voteCount,
        trailerUrl,
      ];
}
