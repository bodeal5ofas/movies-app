import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/constant.dart';
import 'package:movies/utils/service_locater.dart';
import 'package:movies/utils/theme.dart';

void main() async {
  setUpLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(PopularFilmModelAdapter());
  var moveBox = await Hive.openBox<PopularFilmModel>(kMoveBox);
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: Mytheme.maintheme,
      routerConfig: AppRoutes.goRouter,
    );
  }
}
