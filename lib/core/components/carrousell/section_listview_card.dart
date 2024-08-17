import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:flutter/material.dart';

import 'package:clean_arch_movie_flutter/core/components/carrousell/image_with_shimmer.dart';

class SectionListViewCard extends StatelessWidget {
  final bool? isMovie;
  final dynamic media;

  const SectionListViewCard({
    required this.media,
    required this.isMovie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              navigateToDetailsView(context, isMovie!, media.id!);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWithShimmer(
                  imageUrl: "https://image.tmdb.org/t/p/w780${media.posterUrl}",
                  width: double.infinity,
                  height: 175),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                media.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Color(0xffffbe21),
                    size: 18,
                  ),
                  Text(
                    '${media.voteAverage.toStringAsFixed(1)}/10',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
