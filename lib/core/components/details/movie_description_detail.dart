import 'package:clean_arch_movie_flutter/core/components/details/dot_circle.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:flutter/material.dart';

class MovieDescriptionDetail extends StatelessWidget {
  final MovieDetailsEntity movieDetails;
  const MovieDescriptionDetail({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    if (movieDetails.releaseDate!.isNotEmpty && movieDetails.runtime != null) {
      return Row(
        children: [
          if (movieDetails.releaseDate!.isNotEmpty) ...[
            Text(
              movieDetails.releaseDate!.split('-')[0],
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 16,
              ),
            ),
            const DotCircle(),
          ],
          Text(
            "Action",
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 16,
            ),
          ),
          const DotCircle(),
          Text(
            '${movieDetails.runtime!} min',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 16,
            ),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
