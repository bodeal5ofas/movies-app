import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/presentation/view/widgets/watchlist_tap/watchlist_iteam.dart';
import 'package:movies/features/home/presentation/view_model/app_cubit/app_cubit.dart';

class CustomWishlistView extends StatelessWidget {
  const CustomWishlistView({
    super.key,
  });

//   @override
//   State<CustomWishlistView> createState() => _CustomWishlistView();
// }

// class _CustomWishlistView extends State<CustomWishlistView> {
//    late List<PopularFilmModel> movies;
//   late AppCubit provider;
//   @override
  // void initState() {
  //   provider = BlocProvider.of<AppCubit>(context);
  //   //var box = Hive.box<PopularFilmModel>(kMoveBox);
  //   movies = provider.moveBox.values.toList();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<AppCubit>(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: provider.moveBox.length,
            itemBuilder: (context, index) => WatchlistIteam(
              filmModel: provider.moveBox.values.toList()[index],
            ),
          ),
        );
      },
    );
  }
}
