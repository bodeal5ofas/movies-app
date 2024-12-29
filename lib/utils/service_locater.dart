import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/features/home/data/repo/category_repo/category_repo.dart';
import 'package:movies/features/home/data/repo/category_repo/category_repo_impl.dart';
import 'package:movies/features/home/data/repo/details_repo/details_repo.dart';
import 'package:movies/features/home/data/repo/details_repo/details_repo_impl.dart';
import 'package:movies/features/home/data/repo/home_repo/home_repo.dart';
import 'package:movies/features/home/data/repo/home_repo/home_repo_impl.dart';
import 'package:movies/features/home/data/repo/search_repo.dart/search_repo.dart';
import 'package:movies/features/home/data/repo/search_repo.dart/search_repo_impl.dart';
import 'package:movies/features/home/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:movies/utils/api_service.dart';

GetIt getIt = GetIt.instance;
void setUpLocator() {
  getIt.registerSingleton<ApiService>((ApiService(Dio())));
  getIt.registerSingleton<HomeRepo>(((HomeRepoImpl(getIt.get<ApiService>()))));
  getIt.registerSingleton<DetailsRepo>(
      (DetailsRepoImpl(getIt.get<ApiService>())));
      getIt.registerSingleton<CategoryRepo>((CategoryRepoImpl(getIt.get<ApiService>())));
      getIt.registerSingleton<SearchRepo>((SearchRepoImpl(getIt.get<ApiService>())));
      
}
