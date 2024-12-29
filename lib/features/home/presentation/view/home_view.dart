import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widgets/custom_bottom_naigation.dart';
//import 'package:flutter/widgets.dart';
// import 'package:movies/features/home/presentation/view/widgets/home_tap/banner_iteam.dart';
// import 'package:movies/features/home/presentation/view/widgets/home_tap/new_section.dart';
// import 'package:movies/features/home/presentation/view/widgets/home_tap/recommend_section.dart';
import 'package:movies/features/home/presentation/view_model/app_cubit/app_cubit.dart';
//import 'package:movies/features/home/presentation/view/widgets/film_iteam.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late AppCubit provider;
  @override
  void initState() {
    provider = BlocProvider.of<AppCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(child: provider.taps[provider.currentIndex]),
        bottomNavigationBar: CustomBottomNaigation(
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.changeindex(index);
            setState(() {});
          },
        ),
      ),
    );
  }
}
