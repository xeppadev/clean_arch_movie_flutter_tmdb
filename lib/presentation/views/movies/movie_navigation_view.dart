import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MovieNavigationView extends StatelessWidget {
  const MovieNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
