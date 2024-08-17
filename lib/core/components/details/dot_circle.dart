import 'package:flutter/material.dart';

class DotCircle extends StatelessWidget {
  const DotCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        height: 6,
        width: 6,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0x33ffffff),
        ),
      ),
    );
  }
}
