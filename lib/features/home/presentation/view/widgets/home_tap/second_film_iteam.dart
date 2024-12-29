import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/presentation/view/widgets/film_iteam.dart';
import 'package:movies/utils/app_routes.dart';

class SecondFilmIteam extends StatelessWidget {
  const SecondFilmIteam({super.key, required this.filmModel});
  final PopularFilmModel filmModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kDetailsView);
      },
      child: SizedBox(
        height: 184,
        width: 97,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilmIteam(filmModel: filmModel, height: 128, width: 96),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${filmModel.voteAverage}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
            Text(
              '${filmModel.title}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14),
            ),
            Text(
              'realse ${filmModel.releaseDate}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
