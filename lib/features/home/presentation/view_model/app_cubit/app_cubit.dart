import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/data/repo/category_repo/category_repo.dart';
import 'package:movies/features/home/data/repo/home_repo/home_repo.dart';
import 'package:movies/features/home/data/repo/search_repo.dart/search_repo.dart';
import 'package:movies/features/home/presentation/view/widgets/browse_tap/browse_tap.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/home_tap.dart';
import 'package:movies/features/home/presentation/view/widgets/search_tap/search_tap.dart';
import 'package:movies/features/home/presentation/view/widgets/watchlist_tap/watchlist_tap.dart';
import 'package:movies/features/home/presentation/view_model/category_cubit/category_cubit.dart';
import 'package:movies/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:movies/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:movies/utils/constant.dart';
import 'package:movies/utils/service_locater.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  List<Widget> taps = [
    BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepo>())
        ..getPopularfilm()
        ..getNewRelease()
        ..getRecommend(),
      child: const HomeTap(),
    ),
    BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepo>()),
      child: const SearchTap(),
    ),
    BlocProvider(
      create: (context) =>
          CategoryCubit(getIt.get<CategoryRepo>())..getAllCategory(),
      child: const BrowseTap(),
    ),
    const WatchlistTap()
  ];
  int currentIndex = 0;
  var moveBox = Hive.box<PopularFilmModel>(kMoveBox);
  void changeindex(index) {
    currentIndex = index;
  }

  addToWishList({required PopularFilmModel film}) async {
    try {
      await moveBox.put(film.title, film);
      emit(AddMoveSuccefully());
    } catch (e) {
      emit(AddMoveFailure(errMessage: e.toString()));
    }
  }

  removeFromWishList({required PopularFilmModel film}) async {
    emit(AppInitialState());
    try {
      await moveBox.delete(film.title);
      
      emit(RemoveMoveSuccefully());
    } catch (e) {
      emit(RemoveMoveFailure(errMessage: e.toString()));
    }
  }
}
