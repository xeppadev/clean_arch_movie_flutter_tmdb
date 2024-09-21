import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final List<SearchEntity> _searchList = [];
  String query = ""; // Inicializar con una cadena vacía por defecto
  final SearchUsecases _searchUsecases;

  int _page = 1;
  bool hasReachedMax = false;

  SearchCubit(this._searchUsecases) : super(SearchEmpty());

  void updateQuery(String newQuery) {
    query = newQuery;
    _page = 1;
    hasReachedMax = false;
    _searchList.clear();
    getSearchResult();
  }

  Future<void> getSearchResult() async {
    try {
      if (hasReachedMax) return;

      if (state is! SearchLoaded) {
        emit(SearchLoading());
      }

      final result = await _searchUsecases.search(page: _page, query: query);

      result.fold((error) {
        emit(SearchError(message: error.message));
      }, (success) {
        _page++;
        _searchList
            .addAll(success.where((search) => !_searchList.contains(search)));
        if (success.length < 20) {
          hasReachedMax = true;
        }
        emit(SearchLoaded(resultSearch: List.of(_searchList)));
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> fetchMoreResults() async {
    try {
      if (hasReachedMax) return;

      final result = await _searchUsecases.search(page: _page, query: query);

      result.fold((error) {
        emit(SearchError(message: error.message));
      }, (success) {
        _page++;
        _searchList
            .addAll(success.where((search) => !_searchList.contains(search)));
        if (success.length < 20) {
          hasReachedMax = true;
        }
        emit(SearchLoaded(resultSearch: List.of(_searchList)));
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
