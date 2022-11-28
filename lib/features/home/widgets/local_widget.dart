import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/colors.dart';
import 'package:tic_tac_toe/core/constants.dart';

Widget getTextResult(String txt, {Color? color}) {
  return Text(txt,
      style: TextStyle(
          color: color ?? AppColors.black,
          fontSize: 40,
          fontWeight: FontWeight.w700));
}

Widget getGridContainerXO(
    int i, int j, String xo, void Function() checkedOntapGridView) {
  return InkWell(
    onTap: (() {
      checkedOntapGridView();
    }),
    child: Container(
      height: 20,
      width: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(9)),
      child: getTextResult(xo,
          color:
              xo == AppString.x ? AppColors.lightOrang : AppColors.lightYellow),
    ),
  );
}

Widget getRowPlayers({required bool trunPlayerOne}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      getPlayer1(),
      const SizedBox(
        width: 8,
      ),
      getCirclePlayer(trunPlayerOne ? AppColors.darkOrang : AppColors.white),
      const SizedBox(
        width: 40,
      ),
      getCirclePlayer(trunPlayerOne ? AppColors.white : AppColors.lightYellow),
      const SizedBox(
        width: 8,
      ),
      getPlayer2(),
    ],
  );
}

Widget getPlayer1() {
  return playerContainer(
      borderColor: AppColors.darkOrang,
      color: AppColors.lightOrang,
      name: AppString.player1);
}

Widget getPlayer2() {
  return playerContainer(
      borderColor: AppColors.darkYellow,
      color: AppColors.lightYellow,
      name: AppString.player2);
}

Widget getCirclePlayer(Color color) {
  return Container(
    height: 26,
    width: 26,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.white,
        border: Border.all(width: 1, color: color)),
    child: Container(
      height: 20,
      width: 20,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    ),
  );
}

Widget playerContainer(
    {required Color color, required Color borderColor, required String name}) {
  return Container(
    height: 32,
    width: 88,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(9)),
    child: Text(
      name,
      style: TextStyle(
          color: AppColors.black, fontSize: 12, fontWeight: FontWeight.bold),
    ),
  );
}

Widget getInstractionButton({required void Function() onTap}) {
  return InkWell(
    onTap: () {
      onTap();
      // showAletDialog(AppString.offlineGame, () {});
    },
    child: Container(
        height: 26,
        width: 118,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.borderPrimaryColor),
            borderRadius: BorderRadius.circular(16)),
        child: const Text(
          AppString.instructions,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        )),
  );
}
