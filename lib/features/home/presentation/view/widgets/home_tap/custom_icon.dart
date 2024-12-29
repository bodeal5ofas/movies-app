import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:movies/utils/service_locater.dart';

class CustomIcon extends StatefulWidget {
  const CustomIcon({super.key, required this.filmModel});
  final PopularFilmModel filmModel;
  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<AppCubit>(context);
    return GestureDetector(
      onTap: () {
        if (isSaved == false) {
          provider.addToWishList(film: widget.filmModel);
        } else {
     
        }
        isSaved = !isSaved;
        

        setState(() {});
      },
      child: Icon(
        isSaved == false ? Icons.bookmark_add_outlined : Icons.bookmark_added,
        size: 35,
        color: isSaved == false ? Colors.white : Colors.amber,
      ),
    );

    // return Container(
    //   height: 40,
    //   width: 30,
    //   decoration: BoxDecoration(
    //     //borderRadius: BorderRadius.only(
    //     //  bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    //     color: Color(0xff514F4F),
    //   ),
    //   child: Center(
    //     child: Icon(
    //       Icons.add,
    //       color: Colors.white,
    //     ),
    //   ),
    // );
  }
}
