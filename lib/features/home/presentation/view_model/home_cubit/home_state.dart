part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class GetPopularLoadingState extends HomeState {}

class GetPopularFailureState extends HomeState {
  final String errMessage;

  const GetPopularFailureState({required this.errMessage});
}

class GetPopularSucessState extends HomeState {
  final List<PopularFilmModel> filmList;

  const GetPopularSucessState({required this.filmList});
}

class GetNewReleaseLoadingState extends HomeState {}

class GetNewReleaseFailureState extends HomeState {
  final String errMessage;

  const GetNewReleaseFailureState({required this.errMessage});
}

class GetNewReleaseSucessState extends HomeState {
  final List<PopularFilmModel> filmList;

  const GetNewReleaseSucessState({required this.filmList});
}

class GetRecommendLoadingState extends HomeState {}

class GetRecommendFailureState extends HomeState {
  final String errMessage;

  const GetRecommendFailureState({required this.errMessage});
}

class GetRecommendSucessState extends HomeState {
  final List<PopularFilmModel> filmList;

  const GetRecommendSucessState({required this.filmList});
}
