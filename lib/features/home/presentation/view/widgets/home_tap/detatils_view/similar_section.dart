import 'package:flutter/material.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/detatils_view/custom_similar_list_view.dart';

class SimilarSection extends StatelessWidget {
  const SimilarSection({super.key});

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
              "More Like This",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Expanded(child: CustomSimilarListView()),
        ],
      ),
    );
  }
}
