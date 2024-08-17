import 'package:clean_arch_movie_flutter/data/datasources/local/collections/export_collections.dart';

abstract class WatchlistLocalDataSource {
  const WatchlistLocalDataSource();

  ///Guarda los detalles de las series de televisión en el local data source.
  Future<void> saveWatchlistDetails(
      {required WatchlistCollection watchlistCollection});

  ///Elimina los detalles de las series de televisión del local data source.
  Future<void> deleteWatchlistDetails({required int watchlistId});

  ///Verifica si la serie de televisión está guardada en el local data source.
  Future<bool> isWatchlistSaved({required int watchlistId});

  ///Recupera la lista de series de televisión guardadas en el local data source.
  Future<List<WatchlistCollection>> getSavedWatchlistDetails();
}
