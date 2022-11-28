import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants.dart';
import 'package:tic_tac_toe/features/home/view/home_view.dart';
import 'package:tic_tac_toe/features/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}
//عبدالكريم الخطيب  
//s00186
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splashRoute,
      routes: {
        Routes.splashRoute: (context) => const SplashView(),
        Routes.homeRoute: (context) => const HomeView()
      },
    );
  }
}
