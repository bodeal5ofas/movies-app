import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/features/home/data/models/category_model.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/data/repo/category_repo/category_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryInitialState());
  CategoryRepo categoryRepo;
  List<String> images = [
    'assets/images/Action_movie.jpg',
    'assets/images/Adventure_movie.jpg',
    'assets/images/Animation_movie.jpg',
    'assets/images/Comedy_movie.jpg',
    'assets/images/Crime_movie.jpg',
    'assets/images/Documentary_movie.jpg',
    'assets/images/Drama_movie.jpg',
    'assets/images/Family_movie.jpg',
    'assets/images/Fantasy_movie.jpg',
    'assets/images/History_movie.jpg',
    'assets/images/Horror_movie.jpg',
    'assets/images/Music_movie.jpg',
    'assets/images/Mystery_movie.jpg',
    'assets/images/Romance_movie.jpg',
    'assets/images/Science_Fiction_movie.jpg',
  ];
  getAllCategory() async {
    emit(CategoryLoadingState());
    var result = await categoryRepo.getAllCategory();
    result.fold(
      (error) {
        emit(CategoryFailureState(errMessage: error.errorMessage));
      },
      (categories) {
        emit(CategorySucessState(images: images, categories: categories));
      },
    );
  }

  getCategoryMovies() async {
    emit(CategoryMoviesLoadingState());
    var result = await categoryRepo.getCategoryMovies();
    result.fold(
      (error) {
        emit(CategoryMoviesFailureState(errMessage: error.errorMessage));
      },
      (movies) {
        emit(CategoryMoviesSucessState( movies: movies));
      },
    );
  }
}
