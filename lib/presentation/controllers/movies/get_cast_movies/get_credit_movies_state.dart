part of 'get_credit_movies_cubit.dart';

class GetCreditMoviesState extends Equatable {
  const GetCreditMoviesState();

  @override
  List<Object> get props => [];
}

class GetCreditCastMoviesInitial extends GetCreditMoviesState {}

class GetCreditMoviesLoading extends GetCreditMoviesState {
  const GetCreditMoviesLoading();
}

class GetCreditMoviesLoaded extends GetCreditMoviesState {
  const GetCreditMoviesLoaded({required this.castMovies});

  final MovieCreditEntity castMovies;

  @override
  List<Object> get props => [castMovies];
}

class GetCreditMoviesError extends GetCreditMoviesState {
  const GetCreditMoviesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
