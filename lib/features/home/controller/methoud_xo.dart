class Controller {
  static bool checkeWinner(String xo, int i, int j, List<List<String>> board) {
    if (board[0][0] == xo && board[1][1] == xo && board[2][2] == xo) {
      return true;
    } else if (board[0][2] == xo && board[1][1] == xo && board[2][0] == xo) {
      return true;
    }
    if (board[i][0] == xo && board[i][1] == xo && board[i][2] == xo) {
      return true;
    }
    if (board[0][j] == xo && board[1][j] == xo && board[2][j] == xo) {
      return true;
    } else {
      return false;
    }
  }
}
