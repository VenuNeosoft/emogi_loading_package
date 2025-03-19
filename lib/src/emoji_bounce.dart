import 'package:flutter/material.dart';

class EmojiBounce extends StatefulWidget {
  final String emoji;
  final double size;
  final int duration;

  const EmojiBounce({
    Key? key,
    required this.emoji,
    this.size = 24.0,
    this.duration = 500,
  }) : super(key: key);

  @override
  _EmojiBounceState createState() => _EmojiBounceState();
}

class _EmojiBounceState extends State<EmojiBounce>
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

    _animation = Tween<double>(begin: 0, end: -10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
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
