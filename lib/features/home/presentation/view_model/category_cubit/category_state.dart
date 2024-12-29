part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryFailureState extends CategoryState {
  final String errMessage;

  const CategoryFailureState({required this.errMessage});
}

class CategorySucessState extends CategoryState {
  final List<String> images;
  final List<CategoryModel> categories;

 const CategorySucessState({required this.images, required this.categories});
}
class CategoryMoviesLoadingState extends CategoryState {}

class CategoryMoviesFailureState extends CategoryState {
  final String errMessage;

  const CategoryMoviesFailureState({required this.errMessage});
}

class CategoryMoviesSucessState extends CategoryState {

  final List<PopularFilmModel> movies;

 const CategoryMoviesSucessState({ required this.movies});
}