import 'package:clean_arch_movie_flutter/data/models/tv_show/episode_details_model.dart';

import 'package:clean_arch_movie_flutter/data/models/tv_show/season_details_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/tv_show_credit_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/tv_show_details_model.dart';
import 'package:clean_arch_movie_flutter/data/models/tv_show/tv_show_list_model.dart';

abstract class TvShowRemoteDataSource {
  //* Fuente de datos remota
  /// Devuelve una lista de series de televisión mejor valoradas de la fuerente de datos remota.
  Future<TvShowListModel> getTopRatedTvShows({required int page});

  /// Devuelve una lista de series de televisión populares de la fuente de datos remota.
  Future<TvShowListModel> getPopularTvShows({required int page});

  /// Devuelve los detalles de una serie de televisión específica de la fuente de datos remota.
  Future<TvShowDetailsModel> getTvShowDetails({required int tvShowId});

  /// Devuelve los créditos de una serie de televisión específica de la fuente de datos remota.
  Future<TvShowCreditModel> getTvShowCredit({required int tvShowId});

  /// Devuelve una lista de series de televisión similares a una serie de televisión específica de la fuente de datos remota.
  Future<TvShowListModel> getSimilarTvShows(
      {required int tvShowId, required int page});

  /// Devuelve los detalles de una temporada de una serie de televisión específica de la fuente de datos remota.
  Future<SeasonDetailsModel> getSeasonDetails(
      {required int tvShowId, required int seasonNumber});

  ///  Devuelve los detalles de un episodio de una serie de televisión específica de la fuente de datos remota.
  Future<EpisodeDetailsModel> getEpisodeDetails(
      {required int tvShowId,
      required int seasonNumber,
      required int episodeNumber});
}
