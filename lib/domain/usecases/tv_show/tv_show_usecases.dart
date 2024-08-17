import 'package:clean_arch_movie_flutter/domain/repositories/tv_show/tv_show_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/core/exceptions/network_exception.dart';

class TvShowUsecases {
  final TvShowRepository _repository;

  TvShowUsecases(this._repository);

  //* Fuente de datos remota

  // Recupera las series mejor valoradas del servidor.
  Future<Either<NetworkException, TvShowListEntity>> getTopRatedTvShows(
      {required int page}) async {
    return _repository.getTopRatedTvShows(page: page);
  }

  // Recupera las series populares del servidor.
  Future<Either<NetworkException, TvShowListEntity>> getPopularTvShows(
      {required int page}) async {
    return _repository.getPopularTvShows(page: page);
  }

  // Recupera los detalles de una serie específica del servidor.
  Future<Either<NetworkException, TvShowDetailsEntity>> getTvShowDetails(
      {required int tvShowId}) async {
    return _repository.getTvShowDetails(tvShowId: tvShowId);
  }

  Future<Either<NetworkException, TvShowCreditEntity>> getTvShowCredit(
      {required int tvShowId}) async {
    return _repository.getTvShowCredit(tvShowId: tvShowId);
  }

  // Recupera los detalles de una season de una serie específica del servidor.
  Future<Either<NetworkException, SeasonDetailsEntity>> getSeasonDetails(
      {required int tvShowId, required int seasonNumber}) async {
    return _repository.getSeasonDetails(
        tvShowId: tvShowId, seasonNumber: seasonNumber);
  }

  //  Recupera la lista de episodios de una serie específica del servidor.
  Future<Either<NetworkException, EpisodeDetailEntity>> getEpisodeDetails(
      {required int tvShowId,
      required int seasonNumber,
      required int episodeNumber}) async {
    return _repository.getEpisodeDetails(
        tvShowId: tvShowId,
        seasonNumber: seasonNumber,
        episodeNumber: episodeNumber);
  }

  // Recupera las series de televisión que se parecen a una serie específica del servidor.
  Future<Either<NetworkException, TvShowListEntity>> getSimilarTvShows(
      {required int tvShowId, required int page}) async {
    return _repository.getSimilarTvShows(tvShowId: tvShowId, page: page);
  }
}
