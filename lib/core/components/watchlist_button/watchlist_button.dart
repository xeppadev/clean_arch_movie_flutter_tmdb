import 'package:clean_arch_movie_flutter/domain/entities/watchlist/watchlist.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/toggle_media/toggle_media_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/watchlist/watchlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class WatchlistButton extends StatelessWidget {
  final WatchlistEntity? watchlistEntity;

  final ButtonStyle? _buttonStyle;

  const WatchlistButton({super.key, this.watchlistEntity})
      : _buttonStyle = null;

  WatchlistButton.filled({super.key, required this.watchlistEntity})
      : _buttonStyle = ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.black45),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
          elevation: WidgetStateProperty.all<double>(1.5),
          shadowColor: WidgetStateProperty.all<Color>(Colors.black),
        );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistCubit, WatchListState>(builder: (_, state) {
      if (state is WatchListLoaded) {
        bool isAdded =
            state.media?.any((element) => element.id == watchlistEntity?.id) ??
                false;

        return IconButton(
          style: _buttonStyle,
          padding: EdgeInsets.zero,
          onPressed: () async {
            await GetIt.I<ToggleMediaCubit>()
                .toggleWatchList(watchlistEntity: watchlistEntity!)
                .then(
                    (_) => context.read<WatchlistCubit>().getSavedWatchlist());

            isAdded = !isAdded;
          },
          icon: AnimatedCrossFade(
            firstChild: const Icon(
              Icons.bookmark,
              size: 27,
              color: Colors.white,
            ),
            secondChild: const Icon(
              Icons.bookmark_border,
              size: 27,
              color: Colors.white,
            ),
            crossFadeState:
                isAdded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
          ),
        );
      }

      return const SizedBox();
    });
  }
}
