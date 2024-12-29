import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widgets/search_tap/no_body_search.dart';
import 'package:movies/features/home/presentation/view/widgets/search_tap/search_iteam.dart';
import 'package:movies/features/home/presentation/view_model/search_cubit/search_cubit.dart';

class CustomSearchListView extends StatelessWidget {
  const CustomSearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSucessState) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.films.length,
              itemBuilder: (context, index) => SearchIteam(
                filmModel: state.films[index],
              ),
            ),
          );
        } else if (state is SearchFailureState) {
          return Center(
            child: Text(
              state.errMessage,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        } else if (state is SearchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const NoBodySearch();
        }
      },
    );
  }
}
