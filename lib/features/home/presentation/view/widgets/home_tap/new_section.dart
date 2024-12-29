import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widgets/film_iteam.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/custom_new_realse_film.dart';
import 'package:movies/features/home/presentation/view_model/home_cubit/home_cubit.dart';
//import 'package:movies/features/home/presentation/view/widgets/film_iteam.dart';

class NewSection extends StatelessWidget {
  const NewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,
      color: const Color(0xff282A28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "New Releases",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomNewRealeaseFilms(),
        ],
      ),
    );
  }
}
