//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
//import 'package:movies/features/home/data/models/popular_film_model.dart';
//import 'package:movies/features/home/presentation/view/widgets/home_tap/banner_iteam.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/custom_slider.dart';
import 'package:movies/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:movies/utils/app_routes.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        if (current is GetPopularSucessState) {
          return true;
        } else if (current is GetPopularLoadingState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is GetPopularSucessState) {
          return CustomSlider(filmList: state.filmList);
        } else if (state is GetPopularFailureState) {
          return Center(
            child: Text(
              state.errMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (state is GetPopularLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
