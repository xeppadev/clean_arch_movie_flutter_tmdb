import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/episode_details.dart';

import 'package:clean_arch_movie_flutter/domain/entities/tv_show/season_details.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_credit.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_details.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/tv_show_list.dart';
import 'package:fpdart/fpdart.dart';

abstract class TvShowRepository {
  //* Fuente de datos remota
  /// Recupera las series mejor valoradas del servidor.
  Future<Either<NetworkException, TvShowListEntity>> getTopRatedTvShows(
      {required int page});

  /// Recupera las series populares del servidor.
  Future<Either<NetworkException, TvShowListEntity>> getPopularTvShows(
      {required int page});

  /// Recupera los detalles de una serie específica del servidor.

  Future<Either<NetworkException, TvShowDetailsEntity>> getTvShowDetails(
      {required int tvShowId});

  /// Recupera los créditos de una película específica del servidor.
  Future<Either<NetworkException, TvShowCreditEntity>> getTvShowCredit(
      {required int tvShowId});

  /// Recupera los detalles de una season de una serie específica del servidor.
  Future<Either<NetworkException, SeasonDetailsEntity>> getSeasonDetails(
      {required int tvShowId, required int seasonNumber});

  ///  Recupera la lista de episodios de una serie específica del servidor.
  Future<Either<NetworkException, EpisodeDetailEntity>> getEpisodeDetails(
      {required int tvShowId,
      required int seasonNumber,
      required int episodeNumber});

  /// Recupera las series de televisión que se parecen a una serie específica del servidor.
  Future<Either<NetworkException, TvShowListEntity>> getSimilarTvShows(
      {required int tvShowId, required int page});
}
