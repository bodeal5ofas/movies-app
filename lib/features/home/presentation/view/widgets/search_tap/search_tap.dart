import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widgets/search_tap/custom_search_list_view.dart';
import 'package:movies/features/home/presentation/view/widgets/search_tap/custom_text_field.dart';
//import 'package:movies/features/home/presentation/view/widgets/search_tap/no_body_search.dart';
//import 'package:movies/features/home/presentation/view/widgets/search_tap/search_iteam.dart';
//import 'package:movies/features/home/presentation/view_model/search_cubit/search_cubit.dart';

class SearchTap extends StatelessWidget {
  const SearchTap({super.key});

  @override
  Widget build(BuildContext context) {
    // var provider = BlocProvider.of<SearchCubit>(context);
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CustomTextField(),
          SizedBox(
            height: 20,
          ),
          CustomSearchListView(),
        ],
      ),
    );
  }
}
