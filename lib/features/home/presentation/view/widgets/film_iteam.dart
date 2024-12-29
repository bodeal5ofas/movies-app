import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/custom_icon.dart';
import 'package:movies/utils/app_routes.dart';

class FilmIteam extends StatelessWidget {
  const FilmIteam(
      {super.key,
      required this.height,
      required this.width,
      required this.filmModel});
  final double height;
  final double width;
  final PopularFilmModel filmModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kDetailsView, extra: filmModel.id);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://image.tmdb.org/t/p/original${filmModel.posterPath}',
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: height,
            width: width,
            fit: BoxFit.fill,
          ),
           CustomIcon(filmModel: filmModel,),
        ],
      ),
    );
  }
}
