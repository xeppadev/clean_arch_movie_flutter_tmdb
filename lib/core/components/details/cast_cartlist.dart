import 'package:clean_arch_movie_flutter/core/components/carrousell/image_with_shimmer.dart';
import 'package:clean_arch_movie_flutter/domain/entities/util/cast.dart';
import 'package:flutter/material.dart';

class CastCartlist extends StatelessWidget {
  const CastCartlist({super.key, required this.cast});

  final CastEntity cast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ImageWithShimmer(
              imageUrl: 'https://image.tmdb.org/t/p/w500${cast.profileUrl}',
              height: 135,
              width: double.infinity,
            ),
          ),
          Text(
            cast.name ?? '',
            maxLines: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
