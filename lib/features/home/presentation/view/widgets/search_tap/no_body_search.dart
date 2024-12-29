import 'package:flutter/material.dart';
import 'package:movies/utils/constant.dart';

class NoBodySearch extends StatelessWidget {
  const NoBodySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Spacer(),
          const Icon(
            Icons.local_movies_outlined,
            color: kSecondColor,
            size: 100,
          ),
          Text(
            'No movies found',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
