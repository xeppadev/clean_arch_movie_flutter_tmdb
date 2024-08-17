import 'package:clean_arch_movie_flutter/data/datasources/_mappers/entity_convertable.dart';
import 'package:clean_arch_movie_flutter/domain/entities/watchlist/watchlist.dart';

import 'package:isar/isar.dart';

part 'watchlist_collection.g.dart';

@Collection()
class WatchlistCollection
    with EntityConvertible<WatchlistCollection, WatchlistEntity> {
  final Id? id;
  final String? title;
  final String? posterUrl;
  final bool? isMovie;
  final double? voteAverage;

  WatchlistCollection({
    this.id,
    this.title,
    this.posterUrl,
    this.isMovie,
    this.voteAverage,
  });

  @override
  WatchlistEntity toEntity() {
    return WatchlistEntity(
      id: id,
      title: title,
      posterUrl: posterUrl,
      isMovie: isMovie,
      voteAverage: voteAverage,
    );
  }

  @override
  WatchlistCollection fromEntity(WatchlistEntity? model) {
    return WatchlistCollection(
      id: model?.id,
      title: model?.title,
      posterUrl: model?.posterUrl,
      isMovie: model?.isMovie,
      voteAverage: model?.voteAverage,
    );
  }
}
