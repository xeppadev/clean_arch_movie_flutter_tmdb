import 'package:clean_arch_movie_flutter/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        lazyLoad: true,
        animationDuration: const Duration(milliseconds: 200),
        routes: const [
          MoviesRoute(),
          SearchRoute(),
          TvShowRoute(),
          WatchlistRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return CrystalNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            unselectedItemColor: Colors.white70,
            backgroundColor: Colors.black.withOpacity(0.1),
            onTap: tabsRouter.setActiveIndex,
            marginR: const EdgeInsets.fromLTRB(50, 35, 50, 5),
            paddingR: const EdgeInsets.only(bottom: 2, top: 2),
            items: [
              CrystalNavigationBarItem(
                icon: FluentIcons.movies_and_tv_24_filled,
                unselectedIcon:FluentIcons.movies_and_tv_24_regular,
                unselectedColor: Colors.grey[600],
                selectedColor: Colors.blue,
              ),
              CrystalNavigationBarItem(
                icon: FluentIcons.search_24_filled,
                unselectedIcon:FluentIcons.search_24_regular,
                unselectedColor: Colors.grey[600],
                selectedColor: Colors.blue,
              ),
              CrystalNavigationBarItem(
                icon: FluentIcons.tv_24_filled,
                unselectedIcon:FluentIcons.tv_24_regular,
                unselectedColor: Colors.grey[600],
                selectedColor: Colors.blue,
              ),
              CrystalNavigationBarItem(
                icon: FluentIcons.book_add_24_filled,
                unselectedIcon:FluentIcons.book_add_24_regular,
                unselectedColor: Colors.grey[600],
                selectedColor: Colors.blue,
              ),
            ],
          );
        });
  }
}
