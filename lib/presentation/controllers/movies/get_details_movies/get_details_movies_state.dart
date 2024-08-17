part of 'get_details_movies_cubit.dart';

class GetDetailsMoviesState extends Equatable {
  const GetDetailsMoviesState();

  @override
  List<Object> get props => [];
}

class GetDetailsMoviesInitial extends GetDetailsMoviesState {}

class GetDetailsMoviesLoading extends GetDetailsMoviesState {
  const GetDetailsMoviesLoading();
}

class GetDetailsMoviesLoaded extends GetDetailsMoviesState {
  const GetDetailsMoviesLoaded({
    required this.movieDetails,
  });

  final MovieDetailsEntity movieDetails;

  @override
  List<Object> get props => [movieDetails];
}

class GetDetailsMoviesError extends GetDetailsMoviesState {
  const GetDetailsMoviesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
