import 'package:clean_arch_movie_flutter/core/components/details/details_card.dart';
import 'package:clean_arch_movie_flutter/core/components/details/episode_card_tv_show.dart';
import 'package:clean_arch_movie_flutter/core/components/details/season_section.dart';
import 'package:clean_arch_movie_flutter/core/components/details/tv_show_description_detail.dart';
import 'package:clean_arch_movie_flutter/core/components/header/header_section.dart';
import 'package:clean_arch_movie_flutter/core/extras/functions.dart';
import 'package:clean_arch_movie_flutter/domain/entities/export_entities.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/tv_show_credit/tv_show_credit_cubit.dart';
import 'package:clean_arch_movie_flutter/presentation/controllers/tv_show/tv_show_details/tv_show_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class TvShowDetailView extends StatefulWidget {
  final int tvshowId;

  const TvShowDetailView({
    super.key,
    @PathParam('tvshowId') required this.tvshowId,
  });

  @override
  State<TvShowDetailView> createState() => _TvShowDetailViewState();
}

class _TvShowDetailViewState extends State<TvShowDetailView> {
  late TvShowCreditCubit _tvShowCreditCubit;
  late TvShowDetailsCubit _tvShowDetailsCubit;

  @override
  void initState() {
    super.initState();
    _tvShowCreditCubit = GetIt.I<TvShowCreditCubit>();
    _tvShowDetailsCubit = GetIt.I<TvShowDetailsCubit>();
    _fetchData();
  }

  @override
  void didUpdateWidget(covariant TvShowDetailView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tvshowId != widget.tvshowId) {
      _fetchData();
    }
  }

  void _fetchData() {
    _tvShowCreditCubit.getTvShowCredit(widget.tvshowId);
    _tvShowDetailsCubit.getTvShowDetails(widget.tvshowId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvShowCreditCubit>.value(value: _tvShowCreditCubit),
        BlocProvider<TvShowDetailsCubit>.value(value: _tvShowDetailsCubit),
      ],
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
            BlocListener<TvShowCreditCubit, TvShowCreditsState>(
              listener: (context, state) {
                if (state is TvShowCreditsError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
            ),
            BlocListener<TvShowDetailsCubit, TvShowDetailsState>(
              listener: (context, state) {
                if (state is TvShowDetailsError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<TvShowCreditCubit, TvShowCreditsState>(
            builder: (context, creditState) {
              return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
                builder: (context, detailsState) {
                  if (creditState is TvShowCreditsLoading ||
                      detailsState is TvShowDetailsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (creditState is TvShowCreditsLoaded &&
                      detailsState is TvShowDetailsLoaded) {
                    return TvShowDetailsWidget(
                      tvShowDetails: detailsState.tvshow,
                      tvShowCredit: creditState.tvshow,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class TvShowDetailsWidget extends StatelessWidget {
  const TvShowDetailsWidget(
      {super.key, required this.tvShowDetails, required this.tvShowCredit});

  final TvShowDetailsEntity tvShowDetails;
  final TvShowCreditEntity tvShowCredit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsCard(
            mediaDetails: tvShowDetails,
            typeMedia: 'tvshow',
            detailsCard: TvShowDescriptionDetail(
              lastEpisode: tvShowDetails.lastEpisodeToAir,
              genres: const ['drama'],
              seasons: tvShowDetails.seasons,
            ),
          ),
          buildOverSection(tvShowDetails.overview),
          const HeaderSection(
            title: 'Last Episode',
          ),
          EpisodeCardTvShow(episode: tvShowDetails.lastEpisodeToAir),
          const HeaderSection(
            title: 'Seasons',
          ),
          SeasonSection(seasons: tvShowDetails.seasons, id: tvShowDetails.id),
        ],
      ),
    ));
  }
}
