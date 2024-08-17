import 'package:flutter/material.dart';
import 'package:clean_arch_movie_flutter/core/components/carrousell/image_with_shimmer.dart';

class SliderCardImage extends StatelessWidget {
  const SliderCardImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.black, Colors.transparent],
          stops: [0.3, 0.5, 1],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      child: ImageWithShimmer(
          imageUrl: image,
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 1.3),
    );
  }
}
