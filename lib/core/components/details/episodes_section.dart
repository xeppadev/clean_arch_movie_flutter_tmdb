import 'package:clean_arch_movie_flutter/core/components/details/episode_card_tv_show.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:flutter/material.dart';

class EpisodesSection extends StatelessWidget {
  const EpisodesSection({super.key, required this.episodes});

  final List<EpisodeDetailEntity>? episodes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: Text(
              'Episodes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              physics: const BouncingScrollPhysics(),
              itemCount: episodes!.length,
              itemBuilder: (context, index) {
                return EpisodeCardTvShow(
                  episode: episodes![index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}
