import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widgets/search_tap/search_iteam.dart';
import 'package:movies/features/home/presentation/view_model/category_cubit/category_cubit.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        BlocBuilder<CategoryCubit, CategoryState>(
          buildWhen: (previous, current) {
            if (current is CategoryMoviesLoadingState) {
              return true;
            } else if (current is CategoryMoviesSucessState) {
              return true;
            } else if (current is CategoryMoviesFailureState) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state is CategoryMoviesSucessState) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) =>
                      SearchIteam(filmModel: state.movies[index]),
                ),
              );
            } else if (state is CategoryMoviesLoadingState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (state is CategoryMoviesFailureState) {
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
        )
      ],
    ));
  }
}
