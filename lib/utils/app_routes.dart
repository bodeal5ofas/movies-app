import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/features/home/data/repo/category_repo/category_repo.dart';
import 'package:movies/features/home/data/repo/details_repo/details_repo.dart';
import 'package:movies/features/home/presentation/view/home_view.dart';
import 'package:movies/features/home/presentation/view/widgets/browse_tap/category_details.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/detatils_view/movie_details.dart';
import 'package:movies/features/home/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:movies/features/home/presentation/view_model/category_cubit/category_cubit.dart';
import 'package:movies/features/home/presentation/view_model/details_cubit/details_cubit.dart';
import 'package:movies/features/splash/presentation/view/splash_view.dart';
import 'package:movies/utils/service_locater.dart';

abstract class AppRoutes {
  static String kHomeView = '/homeView';
  static String kCategoryView = '/categoryDetails';
  static String kDetailsView = '/detailsView';

  static GoRouter goRouter = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => BlocProvider(
        create: (context) => AppCubit(),
        child: const HomeView(),
      ),
    ),
    GoRoute(
        path: kDetailsView,
        builder: (context, state) {
          var moveId = state.extra as int;
          return MultiBlocProvider(providers: [
            BlocProvider(
            create: (context) => DetailsCubit(getIt.get<DetailsRepo>())
              ..getDetails(moveId: moveId)
              ..getSimilarMovies(moveId: moveId),
           
          ),
          BlocProvider(create: (context) => AppCubit(),),
          ], child:const MovieDetails());
        }),
    GoRoute(
      path: kCategoryView,
      builder: (context, state) =>  BlocProvider(
        create: (context) => CategoryCubit(getIt.get<CategoryRepo>())..getCategoryMovies(),
        child:const CategoryDetails(),
      ),
    ),
  ]);
}
