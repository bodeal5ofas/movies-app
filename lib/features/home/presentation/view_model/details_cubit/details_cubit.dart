import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/features/home/data/models/move_details_model/move_details_model.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/data/repo/details_repo/details_repo.dart';
//import 'package:movies/features/home/data/repo/details_repo/details_repo_impl.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.detailsRepo) : super(DetailsInitialState());
  DetailsRepo detailsRepo;
  getDetails({required int moveId}) async {
    emit(DetailsLoadingState());
    var result = await detailsRepo.getMoveDetails(moveId: moveId);
    result.fold(
      (error) {
        emit(DetailsFailureState(errMessage: error.errorMessage));
      },
      (details) {
        emit(DetailsSucessState(detailsModel: details));
      },
    );
  }

  getSimilarMovies({required int moveId}) async {
    emit(SimilarmoviesLoadingState());
    var result = await detailsRepo.getSimilar(moveId: moveId);
    result.fold(
      (error) {
        emit(SimilarMoviesFailureState(errMessage: error.errorMessage));
      },
      (movies) {
        emit(SimilarMoviesSucessState(movies: movies));
      },
    );
  }
}
