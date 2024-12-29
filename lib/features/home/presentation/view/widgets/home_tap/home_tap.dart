import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:movies/features/home/presentation/view/widgets/home_tap/banner_iteam.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/banner_section.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/new_section.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/recommend_section.dart';
//import 'package:movies/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          BannerSection(),
          NewSection(),
          RecommendSection(),
        ],
      ),
    );
  }
}
