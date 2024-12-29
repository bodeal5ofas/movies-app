import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/data/repo/home_repo/home_repo.dart';
//import 'package:movies/features/home/data/repo/home_repo/home_repo_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  HomeRepo homeRepo;
  getPopularfilm() async {
    emit(GetPopularLoadingState());
    var result = await homeRepo.getPopular();
    result.fold(
      (error) {
        emit(GetPopularFailureState(errMessage: error.errorMessage));
      },
      (films) {
        emit(GetPopularSucessState(filmList: films));
      },
    );
  }

  getNewRelease() async {
    emit(GetNewReleaseLoadingState());
    var result = await homeRepo.getNewRelease();
    result.fold(
      (error) {
        emit(GetNewReleaseFailureState(errMessage: error.errorMessage));
      },
      (films) {
        emit(GetNewReleaseSucessState(filmList: films));
      },
    );
  }

  getRecommend() async {
    emit(GetRecommendLoadingState());
    var result = await homeRepo.getRecommend();
    result.fold(
      (error) {
        emit(GetRecommendFailureState(errMessage: error.errorMessage));
      },
      (films) {
        emit(GetRecommendSucessState(filmList: films));
      },
    );
  }
}
