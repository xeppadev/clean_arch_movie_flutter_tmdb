import 'package:clean_arch_movie_flutter/core/constants/url_constants.dart';
import 'package:clean_arch_movie_flutter/core/network/dio_client.dart';
import 'package:clean_arch_movie_flutter/data/datasources/remote/search/search_data_source.dart';
import 'package:clean_arch_movie_flutter/data/models/search/search_model.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final DioClient _dioClient;

  const SearchRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<SearchModel>> search(
      {required String query, required int page}) async {
    try {
      final response = await _dioClient.get(UrlConstants.search,
          queryParameters: {'query': query, 'page': page});

      final modelList = (response.data['results'] as List)
          .where((e) => e['media_type'] != 'person')
          .map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return modelList;
    } catch (_) {
      rethrow;
    }
  }
}
