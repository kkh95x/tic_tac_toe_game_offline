import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/colors.dart';
import 'package:tic_tac_toe/core/constants.dart';

Widget getTicTacToeText() {
  return Text(
    AppString.ticTacToe,
    style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: AppColors.txtTitleColor),
  );
}
