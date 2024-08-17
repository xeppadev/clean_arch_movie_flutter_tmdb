import 'package:clean_arch_movie_flutter/core/components/details/season_card.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_movie_flutter/domain/entities/tv_show/season_details.dart';

class SeasonSection extends StatelessWidget {
  const SeasonSection({super.key, required this.seasons, required this.id});

  final List<SeasonDetailsEntity>? seasons;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 400),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        itemCount: seasons!.length,
        itemBuilder: (context, index) => SeasonCard(
          season: seasons![index],
          id: id!,
        ),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 14);
        },
      ),
    );
  }
}
