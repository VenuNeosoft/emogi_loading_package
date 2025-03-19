import 'package:flutter/material.dart';

class EmojiPulse extends StatefulWidget {
  final String emoji;
  final double size;
  final int duration;

  const EmojiPulse({
    Key? key,
    required this.emoji,
    this.size = 24.0,
    this.duration = 700,
  }) : super(key: key);

  @override
  _EmojiPulseState createState() => _EmojiPulseState();
}

class _EmojiPulseState extends State<EmojiPulse>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
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
