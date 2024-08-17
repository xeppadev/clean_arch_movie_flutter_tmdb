class UrlConstants {
  //Movies
  static const popularMovies = '/movie/popular';
  static const topRatedMovies = '/movie/top_rated';
  static const movieDetails = '/movie/{movie_id}';
  static const similarMovies = '/movie/{movie_id}/similar';
  static const movieCredits = '/movie/{movie_id}/credits';
  static const movieVideos = '/movie/{movie_id}/videos';

  //TV Shows
  static const popularTvShows = '/tv/popular';
  static const topRatedTvShows = '/tv/top_rated';
  static const tvShowDetails = '/tv/{series_id}';
  static const similarTvShows = '/tv/{series_id}/similar';
  static const tvShowCredits = '/tv/{series_id}/credits';
  static const tvSeasonDetails = '/tv/{series_id}/season/{season_number}';
  static const tvEpisodeDetails =
      '/tv/{series_id}/season/{season_number}/episode/{episode_number}';
  static const tvShowVideos = '/tv/{series_id}/videos';

  //Search
  static const search = '/search/multi';

  //Actors
  static const actorDetails = '/person/{person_id}';
  static const actorMovies = '/person/{person_id}/movie_credits';
  static const actorTvShows = '/person/{person_id}/tv_credits';

  //Videos
  static const videoMovie = '/movie/{id}/videos';
  static const videoTvShow = '/tv/{id}/videos';
}
