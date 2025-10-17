import 'package:flutter/material.dart';

class GameCell extends StatefulWidget {
  final String value;
  final VoidCallback onTap;
  final bool isWinningCell;
  final String currentPlayer;

  const GameCell({
    super.key,
    required this.value,
    required this.onTap,
    required this.isWinningCell,
    required this.currentPlayer,
  });

  @override
  State<GameCell> createState() => _GameCellState();
}

class _GameCellState extends State<GameCell>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
  }

  @override
  void didUpdateWidget(GameCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value.isEmpty && widget.value.isNotEmpty) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getColor() {
    if (widget.value == 'X') return Colors.blue;
    if (widget.value == 'O') return Colors.red;
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.value.isEmpty ? widget.onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.isWinningCell
              ? _getColor().withOpacity(0.2)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.isWinningCell ? _getColor() : Colors.grey[300]!,
            width: widget.isWinningCell ? 3 : 2,
          ),
        ),
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Text(
              widget.value,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: _getColor(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
