import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:clean_arch_movie_flutter/data/datasources/local/collections/export_collections.dart';
//Aca importamos la colección

class LocalDatabase {
  late final Isar _isar;
  bool _isInitialized = false;

  //Creamos un getter para obtener la base de datos de Isar y lanzar un error si no se ha inicializado
  Isar get db =>
      _isInitialized ? _isar : throw IsarError('Isar not initialized');

  Future<void> initialize() async {
    //Verificamos si la base de datos ya ha sido inicializada
    if (_isInitialized) throw IsarError('Isar has already been initialized.');

    //Obtenemos el directorio de la aplicación
    final directory = await getApplicationDocumentsDirectory();

    // Inicializamos la base de datos de Isar con las colecciones y el directorio de la aplicación
    _isar =
        await Isar.open([WatchlistCollectionSchema], directory: directory.path);

    _isInitialized = true;
  }
}
