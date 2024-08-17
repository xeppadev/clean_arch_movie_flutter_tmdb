import 'package:clean_arch_movie_flutter/core/exceptions/database_exception.dart';

import 'package:clean_arch_movie_flutter/domain/entities/watchlist/watchlist.dart';
import 'package:fpdart/fpdart.dart';

abstract class WatchlistRepository {
  // Remote Data Source
  // Get watchlist
  Future<Either<DatabaseException, List<WatchlistEntity>>> getWatchlist();

  // Add a movie to watchlist
  Future<Either<DatabaseException, void>> addMovieToWatchlist(
      {required WatchlistEntity watchlistEntity});

  // Remove a movie from watchlist
  Future<Either<DatabaseException, void>> removeMovieFromWatchlist(
      {required int? movieId});

  // Check if a movie is in watchlist
  Future<Either<DatabaseException, bool>> isInWatchlist(
      {required int? movieId});
}
