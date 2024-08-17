
import 'package:clean_arch_movie_flutter/data/models/search/search_model.dart';

abstract class SearchRemoteDataSource {
  // Devuelve una lista de resultados de búsqueda de la fuente de datos remota.
  Future<List<SearchModel>> search({required String query, required int page});

}