import 'package:flutter/material.dart';

class EmojiWave extends StatefulWidget {
  final String emoji;
  final double size;
  final int duration;

  const EmojiWave({
    Key? key,
    required this.emoji,
    this.size = 24.0,
    this.duration = 1000,
  }) : super(key: key);

  @override
  _EmojiWaveState createState() => _EmojiWaveState();
}

class _EmojiWaveState extends State<EmojiWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 2.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            5.0 * (1 - _animation.value.abs().remainder(1)) - 2.5,
            0,
          ),
          child: Text(
            widget.emoji,
            style: TextStyle(fontSize: widget.size),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
