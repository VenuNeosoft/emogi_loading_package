import 'package:flutter/material.dart';

class EmojiRotate extends StatefulWidget {
  final String emoji;
  final double size;
  final int duration;

  const EmojiRotate({
    Key? key,
    required this.emoji,
    this.size = 24.0,
    this.duration = 1000,
  }) : super(key: key);

  @override
  EmojiRotateState createState() => EmojiRotateState();
}

class EmojiRotateState extends State<EmojiRotate>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Text(
        widget.emoji,
        style: TextStyle(fontSize: widget.size),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
