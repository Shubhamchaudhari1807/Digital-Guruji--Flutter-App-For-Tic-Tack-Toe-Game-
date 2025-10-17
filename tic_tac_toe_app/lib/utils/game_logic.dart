class GameLogic {
  // Check for winner or draw
  static String? checkWinner(List<String> board) {
    // Winning combinations
    const List<List<int>> winPatterns = [
      [0, 1, 2], // Top row
      [3, 4, 5], // Middle row
      [6, 7, 8], // Bottom row
      [0, 3, 6], // Left column
      [1, 4, 7], // Middle column
      [2, 5, 8], // Right column
      [0, 4, 8], // Diagonal top-left to bottom-right
      [2, 4, 6], // Diagonal top-right to bottom-left
    ];

    // Check each winning pattern
    for (var pattern in winPatterns) {
      String first = board[pattern[0]];
      String second = board[pattern[1]];
      String third = board[pattern[2]];

      if (first.isNotEmpty && first == second && second == third) {
        return first; // Return 'X' or 'O'
      }
    }

    // Check for draw (board full, no winner)
    if (!board.contains('')) {
      return 'Draw';
    }

    return null; // Game continues
  }

  // Get winning pattern indices
  static List<int>? getWinningPattern(List<String> board) {
    const List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      String first = board[pattern[0]];
      String second = board[pattern[1]];
      String third = board[pattern[2]];

      if (first.isNotEmpty && first == second && second == third) {
        return pattern;
      }
    }

    return null;
  }
}
