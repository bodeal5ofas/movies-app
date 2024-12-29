//import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'popular_film_model.g.dart';
@HiveType(typeId: 0)
class PopularFilmModel extends  HiveObject{
  @HiveField(0)
  final bool? adult;
  @HiveField(1)
  final String? backdropPath;
  @HiveField(2)
  final List<dynamic> genreIds;
  @HiveField(3)
  final int? id;
  @HiveField(4)
  final String? originalLanguage;
  @HiveField(5)
  final String? originalTitle;
  @HiveField(6)
  final String? overview;
  @HiveField(7)
  final double? popularity;
  @HiveField(8)
  final String? posterPath;
  @HiveField(9)
  final String? releaseDate;
  @HiveField(10)
  final String? title;
  @HiveField(11)
  final bool? video;
  @HiveField(12)
  final double? voteAverage;
  @HiveField(13)
  final int? voteCount;

   PopularFilmModel({
    this.adult,
    this.backdropPath,
    required this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory PopularFilmModel.fromJson(Map<String, dynamic> json) {
    return PopularFilmModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: json['genre_ids'] as List<dynamic>,
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );
  }

  // Map<String, dynamic> toJson() => {
  //       'adult': adult,
  //       'backdrop_path': backdropPath,
  //       'genre_ids': genreIds,
  //       'id': id,
  //       'original_language': originalLanguage,
  //       'original_title': originalTitle,
  //       'overview': overview,
  //       'popularity': popularity,
  //       'poster_path': posterPath,
  //       'release_date': releaseDate,
  //       'title': title,
  //       'video': video,
  //       'vote_average': voteAverage,
  //       'vote_count': voteCount,
  //     };

 // @override
  // List<Object?> get props {
  //   return [
  //     adult,
  //     backdropPath,
  //     genreIds,
  //     id,
  //     originalLanguage,
  //     originalTitle,
  //     overview,
  //     popularity,
  //     posterPath,
  //     releaseDate,
  //     title,
  //     video,
  //     voteAverage,
  //     voteCount,
  //   ];
  // }
}
