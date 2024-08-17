import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class TvShowNavigationView extends StatelessWidget {
  const TvShowNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
