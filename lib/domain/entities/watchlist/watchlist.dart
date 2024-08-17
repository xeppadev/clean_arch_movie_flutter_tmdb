import 'package:equatable/equatable.dart';

class WatchlistEntity extends Equatable {
  final int? id;
  final String? title;
  final String? posterUrl;
  final bool? isMovie;
  final double? voteAverage;

  const WatchlistEntity({
    this.id,
    this.title,
    this.posterUrl,
    this.isMovie,
    this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterUrl,
        isMovie,
        voteAverage,
      ];
}
