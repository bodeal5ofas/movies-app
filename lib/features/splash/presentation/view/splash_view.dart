import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/utils/app_routes.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 4),
      () {
        GoRouter.of(context).pushReplacement(AppRoutes.kHomeView);
      },
    );
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
    );
  }
}
