import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/data/datasources/remote/search/search_data_source.dart';
import 'package:clean_arch_movie_flutter/domain/entities/search/search.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/search/search_repository.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(
    this.remoteDataSource
  );

  @override
  Future<Either<NetworkException, List<SearchEntity>>> search({required String query, required int page}) async {
    try {
      if (query.isEmpty) {
        return const Right([]);
      }
      final result = await remoteDataSource.search(query: query, page: page);
      final entities = result.map((item) => item.toEntity()).toList();
      return Right(entities);
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
}