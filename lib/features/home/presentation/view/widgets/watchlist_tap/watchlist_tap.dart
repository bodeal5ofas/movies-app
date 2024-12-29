import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/presentation/view/widgets/search_tap/search_iteam.dart';
import 'package:movies/features/home/presentation/view/widgets/watchlist_tap/custom_wishlist_view.dart';
import 'package:movies/features/home/presentation/view/widgets/watchlist_tap/watchlist_iteam.dart';
import 'package:movies/features/home/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:movies/utils/constant.dart';

class WatchlistTap extends StatelessWidget {
  const WatchlistTap({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'WishList',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomWishlistView(),
        ],
      ),
    );
  }
  
  
}

