import 'package:flutter/material.dart';

class PlayerIndicator extends StatelessWidget {
  final String currentPlayer;
  final bool isGameOver;

  const PlayerIndicator({
    super.key,
    required this.currentPlayer,
    required this.isGameOver,
  });

  @override
  Widget build(BuildContext context) {
    Color playerColor = currentPlayer == 'X' ? Colors.blue : Colors.red;

    return AnimatedOpacity(
      opacity: isGameOver ? 0.5 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: playerColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: playerColor.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: playerColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              isGameOver ? 'Game Over' : 'Current Turn: Player $currentPlayer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: playerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
