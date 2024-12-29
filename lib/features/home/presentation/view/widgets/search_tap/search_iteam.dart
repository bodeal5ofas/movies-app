import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/utils/constant.dart';

class SearchIteam extends StatelessWidget {
  const SearchIteam({super.key, required this.filmModel});
  final PopularFilmModel filmModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(border: Border.all(color: kSecondColor)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CachedNetworkImage(
              imageUrl: filmModel.backdropPath == null
                  ? 'https://image.tmdb.org/t/p/w500${filmModel.posterPath}'
                  : 'https://image.tmdb.org/t/p/w500${filmModel.backdropPath}',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 100,
              width: 140,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${filmModel.title}',
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '${filmModel.releaseDate}',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${filmModel.originalTitle}',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
