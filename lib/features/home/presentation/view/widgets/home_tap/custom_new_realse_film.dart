import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widgets/film_iteam.dart';
import 'package:movies/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class CustomNewRealeaseFilms extends StatelessWidget {
  const CustomNewRealeaseFilms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        if (current is GetNewReleaseSucessState) {
          return true;
        } else if (current is GetNewReleaseLoadingState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is GetNewReleaseSucessState) {
          return Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FilmIteam(
                  filmModel: state.filmList[index],
                  height: 130,
                  width: 100,
                ),
              ),
            ),
          );
        } else if (state is GetNewReleaseLoadingState) {
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
