import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/presentation/view/widgets/film_iteam.dart';
import 'package:movies/utils/app_routes.dart';

class BannerIteam extends StatelessWidget {
  const BannerIteam({super.key, required this.filmModel});
  final PopularFilmModel filmModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kDetailsView, extra: filmModel.id);
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
              height: 290,
              width: double.infinity,
              child: Column(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${filmModel.backdropPath}',
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Text(
                      textAlign: TextAlign.right,
                      '   ${filmModel.title}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Text(
                      textAlign: TextAlign.right,
                      'Release: ${filmModel.releaseDate}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  )
                ],
              )),
          FilmIteam(
            filmModel: filmModel,
            height: 200,
            width: 130,
          ),
        ],
      ),
    );
  }
}
