import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class OverSection extends StatelessWidget {
  const OverSection({
    super.key,
    required this.overview,
  });

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ReadMoreText(
        overview,
        trimLines: 5,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'show more',
        trimExpandedText: 'show less',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 16,
        ),
        moreStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        lessStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
