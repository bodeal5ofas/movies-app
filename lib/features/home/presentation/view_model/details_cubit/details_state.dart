part of 'details_cubit.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsInitialState extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsFailureState extends DetailsState {
  final String errMessage;

  const DetailsFailureState({required this.errMessage});
}

class DetailsSucessState extends DetailsState {
  final MoveDetailsModel detailsModel;

  const DetailsSucessState({required this.detailsModel});
}

class SimilarmoviesLoadingState extends DetailsState {}

class SimilarMoviesFailureState extends DetailsState {
  final String errMessage;

  const SimilarMoviesFailureState({required this.errMessage});
}

class SimilarMoviesSucessState extends DetailsState {
  final List<PopularFilmModel> movies;

  const SimilarMoviesSucessState({required this.movies});
}
