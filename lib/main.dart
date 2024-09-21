import 'package:clean_arch_movie_flutter/config/router/app_router.dart';
import 'package:clean_arch_movie_flutter/core/database/local_database.dart';
import 'package:clean_arch_movie_flutter/core/network/dio_client.dart';
import 'package:clean_arch_movie_flutter/data/datasources/export_datasources.dart';
import 'package:clean_arch_movie_flutter/data/repositories/movies/movie_repository_impl.dart';
import 'package:clean_arch_movie_flutter/data/repositories/search/search_repository_impl.dart';
import 'package:clean_arch_movie_flutter/data/repositories/tv_show/tv_show_repository_impl.dart';
import 'package:clean_arch_movie_flutter/data/repositories/video/video_repository_impl.dart';
import 'package:clean_arch_movie_flutter/data/repositories/watchlist/watchlist_repository_impl.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/movies/movie_repository.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/search/search_repository.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/tv_show/tv_show_repository.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/video/video_repository.dart';
import 'package:clean_arch_movie_flutter/domain/repositories/watchlist/watchlist_repository.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/watchlist/watchlist_usecases.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_cast_movies/get_credit_movies_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_details_movies/get_details_movies_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_popular_movies/get_popular_movies_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_similar_movies/get_similar_movies_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/movies/get_top_rated_movies/get_top_rated_movies_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/search/search_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/toggle_media/toggle_media_cubit.dart';

import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/popular_tv_show/popular_tv_show_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/top_rated_tv_show/top_rated_tv_show_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/tv_show_credit/tv_show_credit_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/tv_show_details/tv_show_details_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/tv_show_episodes/tv_show_season_details_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/video/video_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/watchlist/watchlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'injector.dart';

Future main() async {
  await dotenv.load(fileName: ".env.example");
  await init();
  await injector<LocalDatabase>().initialize();
  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PopularTvShowCubit>(
          create: (context) =>
              injector<PopularTvShowCubit>()..getPopularTvShow(),
        ),
        Provider<TopRatedTvShowCubit>(
          create: (context) =>
              injector<TopRatedTvShowCubit>()..getTopRatedTvShow(),
        ),
        Provider<GetPopularMoviesCubit>(
          create: (context) =>
              injector<GetPopularMoviesCubit>()..getPopularMovies(),
        ),
        Provider<GetTopRatedMoviesCubit>(
          create: (context) =>
              injector<GetTopRatedMoviesCubit>()..getTopRatedMovies(),
        ),
        Provider<SearchCubit>(
          create: (context) => injector<SearchCubit>()..getSearchResult(),
        ),
        Provider<GetCreditMoviesCubit>(
          create: (context) => injector<GetCreditMoviesCubit>(),
        ),
        Provider<WatchlistCubit>(
            create: (context) =>
                injector<WatchlistCubit>()..getSavedWatchlist()),
        Provider<ToggleMediaCubit>(
          create: (context) => injector<ToggleMediaCubit>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Muli',
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
