import 'package:dartz/dartz.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/utils/error/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PopularFilmModel>>> getPopular();
  Future<Either<Failure, List<PopularFilmModel>>> getNewRelease();
  Future<Either<Failure, List<PopularFilmModel>>> getRecommend();
}
