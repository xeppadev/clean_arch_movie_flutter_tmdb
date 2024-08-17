import 'package:auto_route/auto_route.dart';
import 'package:clean_arch_movie_flutter/presentation/views/main_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/movies/movie_navigation_view.dart';

import 'package:clean_arch_movie_flutter/presentation/views/movies/movie_detail_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/movies/movie_popular_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/movies/movie_top_rated_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/movies/movies_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/search/search_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/tv_show/tv_show_detail_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/tv_show/tv_show_popular_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/tv_show/tv_show_top_rated_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/tv_show/tv_show_view.dart';

import 'package:clean_arch_movie_flutter/presentation/views/tv_show/tv_show_navigation_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/util/video_view.dart';
import 'package:clean_arch_movie_flutter/presentation/views/watchlist/watchlist_view.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Widget,Route')
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AdaptiveRoute(page: MovieNavigationRoute.page, children: [
              CustomRoute(
                page: MoviesRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                durationInMilliseconds: 500,
              ),
              CustomRoute(
                page: MovieDetailRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                durationInMilliseconds: 500,
              ),
              CustomRoute(
                page: MoviePopularRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                durationInMilliseconds: 500,
              ),
              CustomRoute(
                page: MovieTopRatedRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                durationInMilliseconds: 500,
              ),
            ]),
            AdaptiveRoute(
              page: SearchRoute.page,
            ),
            AdaptiveRoute(page: TvShowNavigationRoute.page, children: [
              CustomRoute(
                page: TvShowRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                durationInMilliseconds: 500,
              ),
              CustomRoute(
                page: TvShowDetailRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                durationInMilliseconds: 500,
              ),
              CustomRoute(
                page: TvShowPopularRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                durationInMilliseconds: 500,
              ),
              CustomRoute(
                page: TvShowTopRatedRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                durationInMilliseconds: 500,
              ),
            ]),
            AdaptiveRoute(
                page: WatchlistRoute.page, title: (_, __) => 'Watchlist'),
          ],
        ),
        CustomRoute(
          page: VideoRoute.page,
        )
      ];
}
