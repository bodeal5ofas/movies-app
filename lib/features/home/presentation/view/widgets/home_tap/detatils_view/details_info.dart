import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/data/models/move_details_model/move_details_model.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/custom_icon.dart';
import 'package:movies/utils/constant.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({super.key, required this.detailsModel,});
  final MoveDetailsModel detailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${detailsModel.title}',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
          ),
          Text(
            'popularite ${detailsModel.popularity}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    // Image.asset(
                    //   'assets/images/film.png',
                    //   height: 200,
                    //   width: 130,
                    //   fit: BoxFit.fill,
                    // )
                    CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500${detailsModel.posterPath}',
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      height: 200,
                      width: 130,
                      fit: BoxFit.fill,
                    ),

                    // CustomIcon(
                    //   filmModel: filmModel,
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 120,
                      child: GridView.builder(
                        itemCount: detailsModel.genres?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) => Container(
                          //    padding: ,
                          decoration: BoxDecoration(
                            border: Border.all(color: kSecondColor),
                          ),
                          child: Center(
                            child: Text(
                              detailsModel.genres?[index].name ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '${detailsModel.overview}',
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          '${detailsModel.voteAverage}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
