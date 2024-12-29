import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/data/repo/search_repo.dart/search_repo.dart';
import 'package:movies/utils/api_service.dart';
import 'package:movies/utils/error/failure.dart';

class SearchRepoImpl extends SearchRepo {
  ApiService apiService;
  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<PopularFilmModel>>> searchFilms({required String title}) async{
    try {
      var result = await apiService.search(title: title);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
