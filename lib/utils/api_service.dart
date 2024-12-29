import 'package:dio/dio.dart';
import 'package:movies/features/home/data/models/category_model.dart';
import 'package:movies/features/home/data/models/move_details_model/move_details_model.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';

class ApiService {
  ApiService(this._dio);
  final String _token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMWIyZDgzNDlhOTgwYjAwNTZhMjhlZGI1NmE3OGRhNCIsIm5iZiI6MTczNDI3NDYyMi44MzYsInN1YiI6IjY3NWVlZTNlZThhNjRhZDc3ZDc2NDY1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ydyvoZRc0AfwxDwSfoZppSFYrseKn1vqKQZuBa6mDGo';
  final Dio _dio;

  Future<List<PopularFilmModel>> getPopular() async {
    List<PopularFilmModel> films = [];
    _dio.options.headers['accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $_token";
    var response = await _dio.get(
        'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1');
    Map<String, dynamic> result = response.data;
    for (var element in result["results"]) {
      films.add(PopularFilmModel.fromJson(element));
    }
    return films;
  }

  Future<List<PopularFilmModel>> getNewRelease() async {
    List<PopularFilmModel> films = [];
    _dio.options.headers['accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $_token";
    var response = await _dio.get(
        'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1');
    Map<String, dynamic> result = response.data;
    for (var element in result["results"]) {
      films.add(PopularFilmModel.fromJson(element));
    }
    return films;
  }

  Future<List<PopularFilmModel>> getRecommend() async {
    List<PopularFilmModel> films = [];
    _dio.options.headers['accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $_token";
    var response = await _dio.get(
        'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1');
    Map<String, dynamic> result = response.data;
    for (var element in result["results"]) {
      films.add(PopularFilmModel.fromJson(element));
    }
    return films;
  }

  Future<MoveDetailsModel> getDetails({required int moveId}) async {
    _dio.options.headers['accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $_token";
    var response = await _dio
        .get('https://api.themoviedb.org/3/movie/$moveId?language=en-US');
    return MoveDetailsModel.fromJson(response.data);
  }

  Future<List<PopularFilmModel>> getSimilar({required int moveId}) async {
    List<PopularFilmModel> films = [];
    _dio.options.headers['accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $_token";
    var response = await _dio.get(
        'https://api.themoviedb.org/3/movie/$moveId/similar?language=en-US&page=1');
    Map<String, dynamic> result = response.data;
    for (var element in result["results"]) {
      films.add(PopularFilmModel.fromJson(element));
    }
    return films;
  }

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> category = [];
    _dio.options.headers['accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $_token";
    var response = await _dio
        .get('https://api.themoviedb.org/3/genre/movie/list?language=en');
    Map<String, dynamic> result = response.data;
    for (var element in result['genres']) {
      category.add(CategoryModel.fromJson(element));
    }
    return category;
  }
  
  Future<List<PopularFilmModel>> search({required String title}) async {
    List<PopularFilmModel> films = [];
    _dio.options.headers['accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $_token";
    var response = await _dio
        .get('https://api.themoviedb.org/3/search/movie?include_adult=false&language=en-US&page=1&query=$title');
    Map<String, dynamic> result = response.data;
    for (var element in result['results']) {
      films.add(PopularFilmModel.fromJson(element));
    }
    return films;
  }

    Future<List<PopularFilmModel>> getCategoryMovies() async {
    List<PopularFilmModel> films = [];
    _dio.options.headers['accept'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer $_token";
    var response = await _dio.get(
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
    Map<String, dynamic> result = response.data;
    for (var element in result["results"]) {
      films.add(PopularFilmModel.fromJson(element));
    }
    return films;
  }
}

//  https://image.tmdb.org/t/p/original/ or  https://image.tmdb.org/t/p/w500
