import 'package:clean_arch_movie_flutter/domain/repositories/search/search_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';


class SearchUsecases {
  final SearchRepository _repository;

  SearchUsecases(this._repository);

  // Recupera las peliculas o series que coincidan con la consulta.
  Future<Either<NetworkException, List<SearchEntity>>> search(
      {required String query, required int page}) async {
    return _repository.search(query: query, page: page);
  }
}