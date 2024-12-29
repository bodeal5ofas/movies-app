part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchFailureState extends SearchState {
  final String errMessage;

  const SearchFailureState({required this.errMessage});
}

class SearchSucessState extends SearchState {
  final List<PopularFilmModel> films;

const  SearchSucessState({required this.films});
}
