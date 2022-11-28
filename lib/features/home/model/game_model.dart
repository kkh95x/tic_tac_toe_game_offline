class GameModel {
  List<List<String>> board;

  bool trunPlayerOne;
  int scorePlayer1;
  int scorePlayer2;
  int counter;

  GameModel(
      {required this.board,
      required this.scorePlayer1,
      required this.scorePlayer2,
      required this.counter,
      required this.trunPlayerOne});
}
