import 'package:clean_arch_movie_flutter/core/components/carrousell/image_with_shimmer.dart';
import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final dynamic media;
  final bool isMovie;

  const SectionCard({
    required this.media,
    required this.isMovie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDetailsView(context, isMovie, media.id!);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 7, 14, 0),
        child: Container(
          height: 155,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ImageWithShimmer(
                    imageUrl:
                        "https://image.tmdb.org/t/p/w780${media.posterUrl}",
                    width: 120,
                    height: double.infinity,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        media.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )),
                  Row(
                    children: [
                      if (isMovie) ...[
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            media.releaseDate,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Color.fromRGBO(255, 190, 33, 1),
                        size: 18,
                      ),
                      Text(
                        media.voteAverage.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 12),
                    child: Text(
                      media.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
