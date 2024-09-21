part of '../main.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector

    //* Network
    ..registerLazySingleton<DioClient>(DioClient.new)
    ..registerLazySingleton<LocalDatabase>(LocalDatabase.new)
    ..registerLazySingleton<TvShowRemoteDataSource>(
        () => TvShowRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<VideoRemoteDataSource>(
        () => VideoRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<WatchlistLocalDataSource>(
        () => WatchlistLocalDataSourceImpl(injector()))

    // Registra TvShowUsecases
    ..registerLazySingleton<TvShowRepository>(
        () => TvShowRepositoryImpl(injector()))
    ..registerLazySingleton<TvShowUsecases>(() => TvShowUsecases(injector()))

    // Registra MovieUsecases
    ..registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(injector()))
    ..registerLazySingleton<MoviesUsecases>(() => MoviesUsecases(injector()))

    // Registra SearchUsecases
    ..registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImpl(injector()))
    ..registerLazySingleton<SearchUsecases>(() => SearchUsecases(injector()))

    // Registra VideoUsecases
    ..registerLazySingleton<VideoRepository>(
        () => VideoRepositoryImpl(injector()))
    ..registerLazySingleton<VideoUsecases>(() => VideoUsecases(injector()))

    //Registra WatchlistUsecases
    ..registerLazySingleton<WatchlistRepository>(
        () => WatchlistRepositoryImpl(injector()))
    ..registerLazySingleton<WatchlistUsecases>(
        () => WatchlistUsecases(injector()))

    // Bloc Watchlist
    ..registerLazySingleton<WatchlistCubit>(
        () => WatchlistCubit(injector<WatchlistUsecases>()))
    ..registerSingleton(ToggleMediaCubit(injector<WatchlistUsecases>()))

    // Bloc Movies
    ..registerLazySingleton<GetPopularMoviesCubit>(
        () => GetPopularMoviesCubit(injector<MoviesUsecases>()))
    ..registerLazySingleton<GetTopRatedMoviesCubit>(
        () => GetTopRatedMoviesCubit(injector<MoviesUsecases>()))
    ..registerLazySingleton<GetDetailsMoviesCubit>(
        () => GetDetailsMoviesCubit(injector<MoviesUsecases>()))
    ..registerLazySingleton<GetCreditMoviesCubit>(
        () => GetCreditMoviesCubit(injector<MoviesUsecases>()))
    ..registerLazySingleton<GetSimilarMoviesCubit>(
        () => GetSimilarMoviesCubit(injector<MoviesUsecases>()))
    // Bloc Search
    ..registerLazySingleton<SearchCubit>(
        () => SearchCubit(injector<SearchUsecases>()))
    // Bloc
    ..registerLazySingleton<PopularTvShowCubit>(
        () => PopularTvShowCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<TopRatedTvShowCubit>(
        () => TopRatedTvShowCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<TvShowCreditCubit>(
        () => TvShowCreditCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<TvShowDetailsCubit>(
        () => TvShowDetailsCubit(injector<TvShowUsecases>()))
    ..registerLazySingleton<TvShowSeasonDetailsCubit>(
        () => TvShowSeasonDetailsCubit(injector<TvShowUsecases>()))

    // VideoPlayerController
    ..registerLazySingleton<VideoCubit>(
        () => VideoCubit(injector<VideoUsecases>()));
}
