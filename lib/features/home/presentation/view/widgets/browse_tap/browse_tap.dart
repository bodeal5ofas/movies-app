import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widgets/browse_tap/category_iteam.dart';
import 'package:movies/features/home/presentation/view_model/category_cubit/category_cubit.dart';

class BrowseTap extends StatelessWidget {
  const BrowseTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse Category',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          BlocBuilder<CategoryCubit, CategoryState>(
            buildWhen: (previous, current) {
              if (current is CategoryLoadingState) {
                return true;
              } else if (current is CategorySucessState) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              if (state is CategorySucessState) {
                return Expanded(
                    child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => CategoryIteam(
                    categoryModel: state.categories[index],
                    image: state.images[index],
                  ),
                ));
              } else if (state is CategoryLoadingState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
