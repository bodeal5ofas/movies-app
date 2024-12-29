import 'package:flutter/material.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/custom_recommend_list_view_film.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/second_film_iteam.dart';

class RecommendSection extends StatelessWidget {
  const RecommendSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 246,
      color: const Color(0xff282A28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              "Recommend",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Expanded(child: CustomRecommendListViewFilm()),
        ],
      ),
    );
  }
}
