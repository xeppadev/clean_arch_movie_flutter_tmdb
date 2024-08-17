part of 'get_similar_movies_cubit.dart';

sealed class GetSimilarMoviesState extends Equatable {
  const GetSimilarMoviesState();

  @override
  List<Object> get props => [];
}

final class GetSimilarMoviesInitial extends GetSimilarMoviesState {}

final class GetSimilarMoviesLoading extends GetSimilarMoviesState {
  const GetSimilarMoviesLoading();
}

final class GetSimilarMoviesLoaded extends GetSimilarMoviesState {
  const GetSimilarMoviesLoaded({required this.movies});

  final List<MovieDetailsEntity> movies;

  @override
  List<Object> get props => [movies];
}

final class GetSimilarMoviesError extends GetSimilarMoviesState {
  const GetSimilarMoviesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
