import 'package:dartz/dartz.dart';
import 'package:movies/features/home/data/models/move_details_model/move_details_model.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/utils/error/failure.dart';

abstract class DetailsRepo {
  Future<Either<Failure, MoveDetailsModel>> getMoveDetails(
      {required int moveId});
  Future<Either<Failure, List<PopularFilmModel>>> getSimilar(
      {required int moveId});
}
