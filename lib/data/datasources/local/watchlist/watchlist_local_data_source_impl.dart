import 'package:clean_arch_movie_flutter/core/database/local_database.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/watchlist/watchlist_local_data_source.dart';
import 'package:isar/isar.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/collections/watchlist/watchlist_collection.dart';

class WatchlistLocalDataSourceImpl implements WatchlistLocalDataSource {
  final LocalDatabase localDatabase;

  WatchlistLocalDataSourceImpl(this.localDatabase);

  @override
  Future<void> deleteWatchlistDetails({required int watchlistId}) async {
    try {
      final db = localDatabase.db;
      await db.writeTxn(() async =>
          db.watchlistCollections.filter().idEqualTo(watchlistId).deleteAll());
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<WatchlistCollection>> getSavedWatchlistDetails() async {
    try {
      final list =
          await localDatabase.db.watchlistCollections.where().findAll();
      return list;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> isWatchlistSaved({required int watchlistId}) async {
    try {
      final db = localDatabase.db;
      final isSaved = await db.watchlistCollections
          .filter()
          .idEqualTo(watchlistId)
          .isNotEmpty();
      return isSaved;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveWatchlistDetails(
      {required WatchlistCollection watchlistCollection}) async {
    try {
      final db = localDatabase.db;
      await db.writeTxn(
          () async => db.watchlistCollections.put(watchlistCollection));
    } catch (_) {
      rethrow;
    }
  }
}
