import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/second_film_iteam.dart';
import 'package:movies/features/home/presentation/view_model/details_cubit/details_cubit.dart';

class CustomSimilarListView extends StatelessWidget {
  const CustomSimilarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      buildWhen: (previous, current) {
        if (current is SimilarMoviesSucessState) {
          return true;
        } else if (current is SimilarmoviesLoadingState) {
          return true;
        } else if (current is SimilarMoviesFailureState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is SimilarMoviesSucessState) {
          return SizedBox(
            height: 270,
            child: ListView.builder(
              itemCount: state.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SecondFilmIteam(
                  filmModel: state.movies[index],
                ),
              ),
            ),
          );
        } else if (state is SimilarmoviesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SimilarMoviesFailureState) {
          return Center(
            child: Text(
              state.errMessage,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
