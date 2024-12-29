import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/banner_iteam.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.filmList,
  });

  final List<PopularFilmModel> filmList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        animateToClosest: true,
        autoPlayCurve: Curves.bounceInOut,
        viewportFraction: 1,
        height: 290,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: filmList.map((film) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: BannerIteam(
                filmModel: film,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
