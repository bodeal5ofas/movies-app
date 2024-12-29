import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/features/home/data/models/move_details_model/move_details_model.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/data/repo/details_repo/details_repo.dart';
import 'package:movies/utils/api_service.dart';
import 'package:movies/utils/error/failure.dart';

class DetailsRepoImpl extends DetailsRepo {
  ApiService apiService;
  DetailsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, MoveDetailsModel>> getMoveDetails(
      {required int moveId}) async {
    try {
      var result = await apiService.getDetails(moveId: moveId);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<PopularFilmModel>>> getSimilar(
      {required int moveId}) async {
    try {
      var result = await apiService.getSimilar(moveId: moveId);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
