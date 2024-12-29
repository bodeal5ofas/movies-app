import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:movies/utils/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<SearchCubit>(context);
    return TextField(
      style: Theme.of(context).textTheme.titleMedium,
      controller: provider.titleController,
      onSubmitted: (value) {
        provider.search(title: value);
              // provider.isSearced = true;
      },
      decoration: InputDecoration(
        fillColor: const Color(0xff514F4F),
        prefixIcon: IconButton(
            onPressed: () {
              
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
