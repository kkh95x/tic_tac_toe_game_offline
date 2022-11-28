import 'package:tic_tac_toe/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/colors.dart';
import 'package:tic_tac_toe/features/home/controller/methoud_xo.dart';
import 'package:tic_tac_toe/features/home/model/game_model.dart';
import 'package:tic_tac_toe/features/widgets/global_widget.dart';

import '../widgets/local_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late GameModel gameModel;
  @override
  void initState() {
    super.initState();

    gameModel = GameModel(
      board: [
        [AppString.empty, AppString.empty, AppString.empty],
        [AppString.empty, AppString.empty, AppString.empty],
        [AppString.empty, AppString.empty, AppString.empty]
      ],
      scorePlayer1: 0,
      scorePlayer2: 0,
      counter: 0,
      trunPlayerOne: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
          child:
              isVerticalDesign() ? getVerticalDesign() : getHorizantlDesign()),
    );
  }

  Widget getVerticalDesign() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
          width: double.infinity,
        ),
        getTicTacToeText(),
        const SizedBox(
          height: 24,
        ),
        getInstractionButton(onTap: () {
          showAletDialog(AppString.offlineGame, () {});
        }),
        const SizedBox(
          height: 48,
        ),
        getRowPlayers(trunPlayerOne: gameModel.trunPlayerOne),
        const SizedBox(
          height: 68,
        ),
        getGridViewForXO(gameModel.board),
        const SizedBox(
          height: 38,
        ),
        getTextResult("${gameModel.scorePlayer1}  -  ${gameModel.scorePlayer2}")
      ],
    );
  }

  Widget getHorizantlDesign() {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            getTicTacToeText(),
            const SizedBox(
              height: 50,
            ),
            getInstractionButton(onTap: () {
              showAletDialog(AppString.offlineGame, () {});
            }),
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 282,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    getPlayer1(),
                    const SizedBox(
                      width: 8,
                    ),
                    getCirclePlayer(gameModel.trunPlayerOne
                        ? AppColors.darkOrang
                        : AppColors.white),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              getGridViewForXO(gameModel.board),
              const SizedBox(
                height: 0.0,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 282,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    getCirclePlayer(gameModel.trunPlayerOne
                        ? AppColors.white
                        : AppColors.lightYellow),
                    const SizedBox(
                      width: 8,
                    ),
                    getPlayer2(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getTextResult("${gameModel.scorePlayer1}"),
                Divider(
                  thickness: 3,
                  indent: 60,
                  endIndent: 60,
                  color: AppColors.black,
                ),
                getTextResult("${gameModel.scorePlayer2}"),
              ],
            ))
      ],
    );
  }

  bool isVerticalDesign() {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    if (size.height > size.width) {
      return true;
    } else {
      return false;
    }
  }

  showAletDialog(String txt, void Function() ontap) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: getTextResult(txt, color: AppColors.lightOrang),
          actions: [
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      ontap();
                    });
                  },
                  child: getTextResult(AppString.ok, color: AppColors.primary)),
            ),
          ],
          backgroundColor: Colors.transparent),
    );
  }

  Widget getGridViewForXO(List<List<String>> list) {
    return SizedBox(
      height: 284,
      width: 282,
      child: GridView.builder(
        primary: false,
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          int i = index ~/ 3;
          int j = index % 3;
          return getGridContainerXO(i, j, gameModel.board[i][j], () {
            if (gameModel.board[i][j] == AppString.empty) {
              setState(() {
                if (gameModel.trunPlayerOne) {
                  gameModel.board[i][j] = AppString.x;
                } else {
                  gameModel.board[i][j] = AppString.o;
                }

                if (Controller.checkeWinner(
                  gameModel.board[i][j],
                  i,
                  j,
                  gameModel.board,
                )) {
                  if (gameModel.trunPlayerOne) {
                    showAletDialog(
                      AppString.player1Win,
                      () {
                        gameModel.scorePlayer1++;
                        refreshBoard();
                      },
                    );
                  } else {
                    showAletDialog(
                      AppString.player2Win,
                      () {
                        gameModel.scorePlayer2++;
                        refreshBoard();
                      },
                    );
                  }
                }

                gameModel.trunPlayerOne = !gameModel.trunPlayerOne;
                gameModel.counter++;
                print(gameModel.counter);
                if (gameModel.counter == 8) {
                  showAletDialog(
                    AppString.gameOver,
                    () {
                      refreshBoard();
                    },
                  );
                }
              });
            }
          });
        },
      ),
    );
  }

  void refreshBoard() {
    gameModel.trunPlayerOne = true;
    gameModel.counter = -1;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        gameModel.board[i][j] = AppString.empty;
      }
    }
  }
}
