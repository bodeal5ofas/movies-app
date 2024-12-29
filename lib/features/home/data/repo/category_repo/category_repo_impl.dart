import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/features/home/data/models/category_model.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/data/repo/category_repo/category_repo.dart';
import 'package:movies/utils/api_service.dart';
import 'package:movies/utils/error/failure.dart';

class CategoryRepoImpl extends CategoryRepo {
  ApiService apiService;
  CategoryRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategory() async {
    try {
      var result = await apiService.getCategories();
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
  Future<Either<Failure, List<PopularFilmModel>>> getCategoryMovies() async {
    try {
      var result = await apiService.getCategoryMovies();
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
