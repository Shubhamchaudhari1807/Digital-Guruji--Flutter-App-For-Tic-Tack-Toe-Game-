import 'package:flutter/material.dart';
import 'game_cell.dart';

class GameBoard extends StatelessWidget {
  final List<String> board;
  final Function(int) onCellTapped;
  final List<int>? winningPattern;
  final String currentPlayer;

  const GameBoard({
    super.key,
    required this.board,
    required this.onCellTapped,
    this.winningPattern,
    required this.currentPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              bool isWinningCell = winningPattern?.contains(index) ?? false;
              return GameCell(
                value: board[index],
                onTap: () => onCellTapped(index),
                isWinningCell: isWinningCell,
                currentPlayer: currentPlayer,
              );
            },
          ),
        ),
      ),
    );
  }
}
