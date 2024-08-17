import 'package:clean_arch_movie_flutter/core/constants/url_constants.dart';
import 'package:clean_arch_movie_flutter/core/network/dio_client.dart';
import 'package:clean_arch_movie_flutter/data/datasources/remote/movies/movie_remote_data_source.dart';
import 'package:clean_arch_movie_flutter/data/models/movies/movie_credit_model.dart';
import 'package:clean_arch_movie_flutter/data/models/movies/movie_details_model.dart';
import 'package:clean_arch_movie_flutter/data/models/movies/movie_list_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final DioClient _dioClient;

  const MovieRemoteDataSourceImpl(this._dioClient);

  @override
  Future<MovieListModel> getTopRatedMovies({required int page}) async {
    try {
      final response = await _dioClient
          .get(UrlConstants.topRatedMovies, queryParameters: {'page': page});

      final model =
          MovieListModel.fromJson(response.data as Map<String, dynamic>);
      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<MovieListModel> getPopularMovies({required int page}) async {
    try {
      final response = await _dioClient
          .get(UrlConstants.popularMovies, queryParameters: {'page': page});

      final model =
          MovieListModel.fromJson(response.data as Map<String, dynamic>);
      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({required int movieId}) async {
    try {
      final response = await _dioClient.get(UrlConstants.movieDetails
          .replaceAll('{movie_id}', movieId.toString()));

      final model =
          MovieDetailsModel.fromJson(response.data as Map<String, dynamic>);
      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<MovieCreditModel> getMovieCredits({required int movieId}) async {
    try {
      final response = await _dioClient.get(UrlConstants.movieCredits
          .replaceAll('{movie_id}', movieId.toString()));

      final model =
          MovieCreditModel.fromJson(response.data as Map<String, dynamic>);
      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<MovieListModel> getSimilarMovies(
      {required int movieId, required int page}) async {
    try {
      final response = await _dioClient.get(
          UrlConstants.similarMovies
              .replaceAll('{movie_id}', movieId.toString()),
          queryParameters: {'page': page});

      final model =
          MovieListModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }
}
