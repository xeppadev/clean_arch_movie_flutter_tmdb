import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/search/search.dart';
import 'package:fpdart/fpdart.dart';


abstract class SearchRepository{
  
  Future<Either<NetworkException, List<SearchEntity>>> search({required String query, required int page});
}