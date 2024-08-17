import 'package:youtube_player_iframe_plus/youtube_player_iframe_plus.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:clean_arch_movie_flutter/domain/usecases/export_usecases.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';

@RoutePage()
class VideoView extends StatelessWidget {
  final int id;
  final String type;
  const VideoView(
      {super.key, @PathParam('id') required this.id, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _VideoPlayerWidget(
        id: id,
        isMovie: type == 'movie',
      ),
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
