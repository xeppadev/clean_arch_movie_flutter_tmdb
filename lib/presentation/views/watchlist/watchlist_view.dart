import 'package:clean_arch_movie_flutter/core/components/carrousell/section_listview_card.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/watchlist/watchlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocListener(
      listeners: [
        BlocListener<WatchlistCubit, WatchListState>(
          listener: (context, state) {
            if (state is WatchListError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
        ),
      ],
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 30)),
          const Text(
            'Watchlist',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          Expanded(child: BlocBuilder<WatchlistCubit, WatchListState>(
            builder: (context, watchlistState) {
              if (watchlistState is WatchlistLoading &&
                  watchlistState is! WatchListLoaded) {
                return const Center(child: CircularProgressIndicator());
              } else if (watchlistState is WatchListLoaded) {
                final media = watchlistState.media;
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 1,
                          childAspectRatio: 0.44,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
                            child: SectionListViewCard(
                              media: media[index],
                              isMovie: media[index].isMovie,
                            ),
                          );
                        },
                        itemCount: media.length,
                      ),
                    )
                  ],
                );
              } else {
                return const Center(child: Text('No movies in watchlist'));
              }
            },
          ))
        ],
      ),
    ));
  }
}
