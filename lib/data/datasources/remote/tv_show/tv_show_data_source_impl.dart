import 'package:clean_arch_movie_flutter/core/network/dio_client.dart';
import 'package:clean_arch_movie_flutter/data/datasources/remote/tv_show/tv_show_data_souce.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/episode_details_model.dart';

import 'package:clean_arch_movie_flutter/data/models/tv_show/season_details_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/tv_show_credit_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/tv_show_details_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/tv_show_list_model.dart';
import 'package:clean_arch_movie_flutter/core/constants/url_constants.dart';

class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource {
  final DioClient _dioClient;

  const TvShowRemoteDataSourceImpl(this._dioClient);

  @override
  Future<TvShowListModel> getTopRatedTvShows({required int page}) async {
    try {
      final response = await _dioClient
          .get(UrlConstants.popularTvShows, queryParameters: {'page': page});
      final model =
          TvShowListModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TvShowListModel> getPopularTvShows({required int page}) async {
    try {
      final response = await _dioClient
          .get(UrlConstants.topRatedTvShows, queryParameters: {'page': page});
      final model =
          TvShowListModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TvShowDetailsModel> getTvShowDetails({required int tvShowId}) async {
    try {
      final response = await _dioClient.get(UrlConstants.tvShowDetails
          .replaceAll('{series_id}', tvShowId.toString()));
      final model =
          TvShowDetailsModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TvShowCreditModel> getTvShowCredit({required int tvShowId}) async {
    try {
      final response = await _dioClient.get(UrlConstants.tvShowCredits
          .replaceAll('{series_id}', tvShowId.toString()));

      final model =
          TvShowCreditModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TvShowListModel> getSimilarTvShows(
      {required int tvShowId, required int page}) async {
    try {
      final response = await _dioClient.get(
          UrlConstants.similarTvShows
              .replaceAll('{series_id}', tvShowId.toString()),
          queryParameters: {'page': page});
      final model =
          TvShowListModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<SeasonDetailsModel> getSeasonDetails(
      {required int tvShowId, required int seasonNumber}) async {
    try {
      final response = await _dioClient.get(UrlConstants.tvSeasonDetails
          .replaceAll('{series_id}', tvShowId.toString())
          .replaceAll('{season_number}', seasonNumber.toString()));
      final model =
          SeasonDetailsModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<EpisodeDetailsModel> getEpisodeDetails(
      {required int tvShowId,
      required int seasonNumber,
      required int episodeNumber}) async {
    try {
      final response = await _dioClient.get(UrlConstants.tvEpisodeDetails
          .replaceAll('{series_id}', tvShowId.toString())
          .replaceAll('{season_number}', seasonNumber.toString())
          .replaceAll('{episode_number}', episodeNumber.toString()));
      final model =
          EpisodeDetailsModel.fromJson(response.data as Map<String, dynamic>);

      return model;
    } catch (_) {
      rethrow;
    }
  }
}
