import 'package:clean_arch_movie_flutter/domain/entities/watchlist/watchlist.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/database_exception.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/watchlist/watchlist_repository.dart';

class WatchlistUsecases {
  final WatchlistRepository _repository;

  WatchlistUsecases(this._repository);

  // Get watchlist
  Future<Either<DatabaseException, List<WatchlistEntity>>>
      getWatchlist() async {
    return _repository.getWatchlist();
  }

  // Add movie to watchlist
  Future<Either<DatabaseException, void>> toggleWatchlist(
      {required WatchlistEntity watchlistEntity}) async {
    final isSaved =
        await _repository.isInWatchlist(movieId: watchlistEntity.id);

    return isSaved.fold((l) => left(l), (r) {
      if (r) {
        return _repository.removeMovieFromWatchlist(
            movieId: watchlistEntity.id);
      } else {
        return _repository.addMovieToWatchlist(
            watchlistEntity: watchlistEntity);
      }
    });
  }
}
