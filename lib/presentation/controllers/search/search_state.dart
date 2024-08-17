part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchEmpty extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  const SearchLoaded({required this.resultSearch});

  final List<SearchEntity> resultSearch;

  @override
  List<Object> get props => [resultSearch];
}

final class SearchError extends SearchState {
  const SearchError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
