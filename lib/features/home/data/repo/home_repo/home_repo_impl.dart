import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/data/repo/home_repo/home_repo.dart';
import 'package:movies/utils/api_service.dart';
import 'package:movies/utils/error/failure.dart';

class HomeRepoImpl extends HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<PopularFilmModel>>> getPopular() async {
    try {
      var result = await apiService.getPopular();
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PopularFilmModel>>> getNewRelease() async {
    try {
      var result = await apiService.getNewRelease();
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PopularFilmModel>>> getRecommend() async {
    try {
      var result = await apiService.getRecommend();
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
