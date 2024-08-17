import 'package:clean_arch_movie_flutter/core/components/carrousell/image_with_shimmer.dart';
import 'package:clean_arch_movie_flutter/core/components/details/episodes_section.dart';
import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/tv_show_episodes/tv_show_season_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SeasonCard extends StatelessWidget {
  const SeasonCard({super.key, required this.season, required this.id});

  final SeasonDetailsEntity season;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      highlightColor: Colors.white.withOpacity(0.2),
      onTap: () {
        bottomSheetShow(
          context,
          _SeasonDetailsWidget(season: season, id: id),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 160,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageWithShimmer(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w1280${season.posterUrl}',
                  width: 115,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    season.name ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      '${season.episodeCount} Episodes',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  if (season.airDate != null)
                    Text(
                      formattedDate(season.airDate!),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  if (season.overview != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        season.overview!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class _SeasonDetailsWidget extends StatefulWidget {
  const _SeasonDetailsWidget({required this.season, required this.id});

  final SeasonDetailsEntity season;
  final int id;

  @override
  State<_SeasonDetailsWidget> createState() => _SeasonDetailsWidgetState();
}

class _SeasonDetailsWidgetState extends State<_SeasonDetailsWidget> {
  late TvShowSeasonDetailsCubit _tvShowSeasonDetailsCubit;

  //Metodo para obtener la instancia del cubit y llamar al metodo para obtener los detalles de la temporada
  @override
  void initState() {
    super.initState();
    _tvShowSeasonDetailsCubit = GetIt.I<TvShowSeasonDetailsCubit>();
    _fetchData();
  }

  // Metodo para actualizar los datos de la temporada
  @override
  void didUpdateWidget(covariant _SeasonDetailsWidget oldWidget) {
    super.didUpdateWidget(oldWidget); // Llama al metodo de la clase padre
    if (oldWidget.season != widget.season) { // Compara si la temporada es diferente
      _fetchData(); // Llama al metodo para obtener los detalles de la temporada
    }
  }

  // Metodo para obtener los detalles de la temporada
  void _fetchData() {
    _tvShowSeasonDetailsCubit.getSeasonDetails(
        widget.id, widget.season.seasonNumber!);
  }

  @override
  Widget build(BuildContext context) {
    // Access the Cubit instance here and trigger the fetch.
    return BlocProvider<TvShowSeasonDetailsCubit>.value(
      value: _tvShowSeasonDetailsCubit,
      child: BlocBuilder<TvShowSeasonDetailsCubit, TvShowSeasonDetailsState>(
        builder: (context, state) {
          if (state is TvShowSeasonDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvShowSeasonDetailsLoaded) {
            return EpisodesSection(episodes: state.detailsEntity.episodes);
          } else if (state is TvShowSeasonDetailsError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
