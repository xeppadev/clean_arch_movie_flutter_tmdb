import 'package:clean_arch_movie_flutter/data/datasources/local/collections/watchlist/watchlist_collection.dart';
import 'package:clean_arch_movie_flutter/domain/entities/watchlist/watchlist.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/watchlist/watchlist_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import 'package:clean_arch_movie_flutter/core/exceptions/database_exception.dart';
import 'package:clean_arch_movie_flutter/data/datasources/export_datasources.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  final WatchlistLocalDataSource _localDataSource;

  WatchlistRepositoryImpl(this._localDataSource);

  @override
  Future<Either<DatabaseException, List<WatchlistEntity>>>
      getWatchlist() async {
    try {
      final result = await _localDataSource.getSavedWatchlistDetails();
      return Right(result.map((e) => e.toEntity()).toList());
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> addMovieToWatchlist(
      {required WatchlistEntity watchlistEntity}) async {
    try {
      final result = await _localDataSource.saveWatchlistDetails(
          watchlistCollection:
              WatchlistCollection().fromEntity(watchlistEntity));
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, bool>> isInWatchlist(
      {required int? movieId}) async {
    try {
      final result =
          await _localDataSource.isWatchlistSaved(watchlistId: movieId!);
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> removeMovieFromWatchlist(
      {required int? movieId}) async {
    try {
      final result =
          await _localDataSource.deleteWatchlistDetails(watchlistId: movieId!);
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }
}
