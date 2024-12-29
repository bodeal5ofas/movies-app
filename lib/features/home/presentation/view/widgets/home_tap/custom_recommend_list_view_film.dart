import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/second_film_iteam.dart';
import 'package:movies/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class CustomRecommendListViewFilm extends StatelessWidget {
  const CustomRecommendListViewFilm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        if (current is GetRecommendSucessState) {
          return true;
        } else if (current is GetRecommendLoadingState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is GetRecommendSucessState) {
          return ListView.builder(
            itemCount: state.filmList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SecondFilmIteam(
                filmModel: state.filmList[index],
              ),
            ),
          );
        } else if (state is GetRecommendLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }
}
