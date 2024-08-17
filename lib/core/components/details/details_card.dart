import 'package:auto_route/auto_route.dart';
import 'package:clean_arch_movie_flutter/config/router/app_router.dart';
import 'package:clean_arch_movie_flutter/core/components/details/slider_card_image.dart';
import 'package:clean_arch_movie_flutter/core/components/watchlist_button/watchlist_button.dart';
import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/domain/entities/watchlist/watchlist.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:youtube_player_iframe_plus/youtube_player_iframe_plus.dart';
import 'package:flutter/services.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.detailsCard,
    required this.mediaDetails,
    required this.typeMedia,
  });

  final Widget detailsCard;
  final dynamic mediaDetails;
  final String typeMedia;

  WatchlistEntity _mapToWatchlistEntity(
      dynamic mediaDetails, String typeMedia) {
    if (mediaDetails is MovieDetailsEntity) {
      return WatchlistEntity(
        id: mediaDetails.id!,
        title: mediaDetails.title!,
        posterUrl: mediaDetails.posterUrl!,
        isMovie: true,
        voteAverage: mediaDetails.voteAverage!,
      );
    } else if (mediaDetails is TvShowDetailsEntity) {
      return WatchlistEntity(
        id: mediaDetails.id!,
        title:
            mediaDetails.title!, // Usamos name en lugar de title para TV Shows
        posterUrl: mediaDetails.posterUrl!,
        isMovie: false,
        voteAverage: mediaDetails.voteAverage!,
      );
    } else {
      throw Exception('Invalid media type');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliderCardImage(
          image: 'https://image.tmdb.org/t/p/w1280${mediaDetails.backdropUrl}',
        ),
        if (mediaDetails is! String) ...[
          Positioned.fill(
            child: Center(
              child: InkWell(
                onTap: () {
                  AutoRouter.of(context).push(
                    VideoRoute(
                      id: mediaDetails.id!,
                      type: typeMedia,
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          mediaDetails.title ?? '',
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 6,
                          ),
                          child: detailsCard,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Text(
                              mediaDetails.voteAverage?.toStringAsFixed(1) ??
                                  'N/A',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              ' (${mediaDetails.voteCount ?? 0} votes)',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 11, right: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  navigateToHomeView(context, typeMedia);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              WatchlistButton.filled(
                watchlistEntity: _mapToWatchlistEntity(mediaDetails, typeMedia),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _VideoPlayerWidget extends StatefulWidget {
  final int id;
  final bool isMovie;

  const _VideoPlayerWidget({
    required this.id,
    required this.isMovie,
  });

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late final VideoUsecases _videoUsecases;
  late Future<VideoEntity> _videoFuture;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _videoUsecases = GetIt.I<VideoUsecases>();
    _videoFuture = _fetchData().then((videoEntity) {
      _controller = YoutubePlayerController(
        initialVideoId: videoEntity.key.toString(),
        params: const YoutubePlayerParams(
          mute: false,
          autoPlay: true,
        ),
      );
      return videoEntity;
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  Future<VideoEntity> _fetchData() async {
    final result =
        await _videoUsecases.getVideo(isMovie: widget.isMovie, id: widget.id);
    return result.fold(
      (error) => throw Exception(error.message),
      (videoEntity) => videoEntity,
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: FutureBuilder<VideoEntity>(
        future: _videoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return Stack(
              children: [
                YoutubePlayerIFramePlus(
                  controller: _controller,
                  aspectRatio: 20 / 9,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded,
                        color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('No data available.'),
            );
          }
        },
      ),
    );
  }
}
