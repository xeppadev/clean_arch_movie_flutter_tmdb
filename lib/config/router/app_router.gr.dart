// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainView(),
      );
    },
    MovieDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieDetailRouteArgs>(
          orElse: () =>
              MovieDetailRouteArgs(movieId: pathParams.getInt('movieId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieDetailView(
          key: args.key,
          movieId: args.movieId,
        ),
      );
    },
    MovieNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MovieNavigationView(),
      );
    },
    MoviePopularRoute.name: (routeData) {
      final args = routeData.argsAs<MoviePopularRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MoviePopularView(
          key: args.key,
          listData: args.listData,
        ),
      );
    },
    MovieTopRatedRoute.name: (routeData) {
      final args = routeData.argsAs<MovieTopRatedRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieTopRatedView(
          key: args.key,
          listData: args.listData,
        ),
      );
    },
    MoviesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MoviesView(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchView(),
      );
    },
    TvShowDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TvShowDetailRouteArgs>(
          orElse: () =>
              TvShowDetailRouteArgs(tvshowId: pathParams.getInt('tvshowId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvShowDetailView(
          key: args.key,
          tvshowId: args.tvshowId,
        ),
      );
    },
    TvShowNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvShowNavigationView(),
      );
    },
    TvShowPopularRoute.name: (routeData) {
      final args = routeData.argsAs<TvShowPopularRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvShowPopularView(
          key: args.key,
          listData: args.listData,
        ),
      );
    },
    TvShowTopRatedRoute.name: (routeData) {
      final args = routeData.argsAs<TvShowTopRatedRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvShowTopRatedView(
          key: args.key,
          listData: args.listData,
        ),
      );
    },
    TvShowRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvShowView(),
      );
    },
    VideoRoute.name: (routeData) {
      final args = routeData.argsAs<VideoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VideoView(
          key: args.key,
          id: args.id,
          type: args.type,
        ),
      );
    },
    WatchlistRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WatchlistView(),
      );
    },
  };
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieDetailView]
class MovieDetailRoute extends PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    Key? key,
    required int movieId,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailRoute.name,
          args: MovieDetailRouteArgs(
            key: key,
            movieId: movieId,
          ),
          rawPathParams: {'movieId': movieId},
          initialChildren: children,
        );

  static const String name = 'MovieDetailRoute';

  static const PageInfo<MovieDetailRouteArgs> page =
      PageInfo<MovieDetailRouteArgs>(name);
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    this.key,
    required this.movieId,
  });

  final Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [MovieNavigationView]
class MovieNavigationRoute extends PageRouteInfo<void> {
  const MovieNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MovieNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MoviePopularView]
class MoviePopularRoute extends PageRouteInfo<MoviePopularRouteArgs> {
  MoviePopularRoute({
    Key? key,
    required List<dynamic> listData,
    List<PageRouteInfo>? children,
  }) : super(
          MoviePopularRoute.name,
          args: MoviePopularRouteArgs(
            key: key,
            listData: listData,
          ),
          initialChildren: children,
        );

  static const String name = 'MoviePopularRoute';

  static const PageInfo<MoviePopularRouteArgs> page =
      PageInfo<MoviePopularRouteArgs>(name);
}

class MoviePopularRouteArgs {
  const MoviePopularRouteArgs({
    this.key,
    required this.listData,
  });

  final Key? key;

  final List<dynamic> listData;

  @override
  String toString() {
    return 'MoviePopularRouteArgs{key: $key, listData: $listData}';
  }
}

/// generated route for
/// [MovieTopRatedView]
class MovieTopRatedRoute extends PageRouteInfo<MovieTopRatedRouteArgs> {
  MovieTopRatedRoute({
    Key? key,
    required List<dynamic> listData,
    List<PageRouteInfo>? children,
  }) : super(
          MovieTopRatedRoute.name,
          args: MovieTopRatedRouteArgs(
            key: key,
            listData: listData,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieTopRatedRoute';

  static const PageInfo<MovieTopRatedRouteArgs> page =
      PageInfo<MovieTopRatedRouteArgs>(name);
}

class MovieTopRatedRouteArgs {
  const MovieTopRatedRouteArgs({
    this.key,
    required this.listData,
  });

  final Key? key;

  final List<dynamic> listData;

  @override
  String toString() {
    return 'MovieTopRatedRouteArgs{key: $key, listData: $listData}';
  }
}

/// generated route for
/// [MoviesView]
class MoviesRoute extends PageRouteInfo<void> {
  const MoviesRoute({List<PageRouteInfo>? children})
      : super(
          MoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoviesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchView]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvShowDetailView]
class TvShowDetailRoute extends PageRouteInfo<TvShowDetailRouteArgs> {
  TvShowDetailRoute({
    Key? key,
    required int tvshowId,
    List<PageRouteInfo>? children,
  }) : super(
          TvShowDetailRoute.name,
          args: TvShowDetailRouteArgs(
            key: key,
            tvshowId: tvshowId,
          ),
          rawPathParams: {'tvshowId': tvshowId},
          initialChildren: children,
        );

  static const String name = 'TvShowDetailRoute';

  static const PageInfo<TvShowDetailRouteArgs> page =
      PageInfo<TvShowDetailRouteArgs>(name);
}

class TvShowDetailRouteArgs {
  const TvShowDetailRouteArgs({
    this.key,
    required this.tvshowId,
  });

  final Key? key;

  final int tvshowId;

  @override
  String toString() {
    return 'TvShowDetailRouteArgs{key: $key, tvshowId: $tvshowId}';
  }
}

/// generated route for
/// [TvShowNavigationView]
class TvShowNavigationRoute extends PageRouteInfo<void> {
  const TvShowNavigationRoute({List<PageRouteInfo>? children})
      : super(
          TvShowNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvShowNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvShowPopularView]
class TvShowPopularRoute extends PageRouteInfo<TvShowPopularRouteArgs> {
  TvShowPopularRoute({
    Key? key,
    required List<dynamic> listData,
    List<PageRouteInfo>? children,
  }) : super(
          TvShowPopularRoute.name,
          args: TvShowPopularRouteArgs(
            key: key,
            listData: listData,
          ),
          initialChildren: children,
        );

  static const String name = 'TvShowPopularRoute';

  static const PageInfo<TvShowPopularRouteArgs> page =
      PageInfo<TvShowPopularRouteArgs>(name);
}

class TvShowPopularRouteArgs {
  const TvShowPopularRouteArgs({
    this.key,
    required this.listData,
  });

  final Key? key;

  final List<dynamic> listData;

  @override
  String toString() {
    return 'TvShowPopularRouteArgs{key: $key, listData: $listData}';
  }
}

/// generated route for
/// [TvShowTopRatedView]
class TvShowTopRatedRoute extends PageRouteInfo<TvShowTopRatedRouteArgs> {
  TvShowTopRatedRoute({
    Key? key,
    required List<dynamic> listData,
    List<PageRouteInfo>? children,
  }) : super(
          TvShowTopRatedRoute.name,
          args: TvShowTopRatedRouteArgs(
            key: key,
            listData: listData,
          ),
          initialChildren: children,
        );

  static const String name = 'TvShowTopRatedRoute';

  static const PageInfo<TvShowTopRatedRouteArgs> page =
      PageInfo<TvShowTopRatedRouteArgs>(name);
}

class TvShowTopRatedRouteArgs {
  const TvShowTopRatedRouteArgs({
    this.key,
    required this.listData,
  });

  final Key? key;

  final List<dynamic> listData;

  @override
  String toString() {
    return 'TvShowTopRatedRouteArgs{key: $key, listData: $listData}';
  }
}

/// generated route for
/// [TvShowView]
class TvShowRoute extends PageRouteInfo<void> {
  const TvShowRoute({List<PageRouteInfo>? children})
      : super(
          TvShowRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvShowRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VideoView]
class VideoRoute extends PageRouteInfo<VideoRouteArgs> {
  VideoRoute({
    Key? key,
    required int id,
    required String type,
    List<PageRouteInfo>? children,
  }) : super(
          VideoRoute.name,
          args: VideoRouteArgs(
            key: key,
            id: id,
            type: type,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'VideoRoute';

  static const PageInfo<VideoRouteArgs> page = PageInfo<VideoRouteArgs>(name);
}

class VideoRouteArgs {
  const VideoRouteArgs({
    this.key,
    required this.id,
    required this.type,
  });

  final Key? key;

  final int id;

  final String type;

  @override
  String toString() {
    return 'VideoRouteArgs{key: $key, id: $id, type: $type}';
  }
}

/// generated route for
/// [WatchlistView]
class WatchlistRoute extends PageRouteInfo<void> {
  const WatchlistRoute({List<PageRouteInfo>? children})
      : super(
          WatchlistRoute.name,
          initialChildren: children,
        );

  static const String name = 'WatchlistRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
