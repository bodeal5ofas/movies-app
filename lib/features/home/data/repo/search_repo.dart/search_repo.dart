import 'package:dartz/dartz.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/utils/error/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<PopularFilmModel>>> searchFilms({required String title});
}
