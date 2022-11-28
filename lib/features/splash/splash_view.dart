import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tic_tac_toe/core/colors.dart';
import 'package:tic_tac_toe/core/constants.dart';
import 'package:tic_tac_toe/features/widgets/global_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
        (_) => {Navigator.pushReplacementNamed(context, Routes.homeRoute)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: getTicTacToeText()),
    );
  }
}
