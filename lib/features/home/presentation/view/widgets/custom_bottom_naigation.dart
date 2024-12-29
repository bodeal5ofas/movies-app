import 'package:flutter/material.dart';
import 'package:movies/utils/constant.dart';

class CustomBottomNaigation extends StatelessWidget {
  const CustomBottomNaigation(
      {super.key, required this.currentIndex, this.onTap});
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: kSecondColor,
        backgroundColor: kMainColor,
        elevation: 50,
        //selectedIconTheme: const IconThemeData(color: Colors.amber),
        selectedLabelStyle: const TextStyle(color: Colors.amber),
        unselectedLabelStyle: const TextStyle(color: kSecondColor),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
            ),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.live_tv_sharp,
            ),
            label: 'WatchList',
          ),
        ]);
  }
}
