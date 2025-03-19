import 'package:flutter/material.dart';
import 'emoji_bounce.dart';
import 'emoji_rotate.dart';
import 'emoji_pulse.dart';
import 'emoji_wave.dart';

enum EmojiAnimationType {
  bounce,
  rotate,
  pulse,
  wave,
}

class EmojiLoading extends StatelessWidget {
  final String emoji;
  final double size;
  final int duration;
  final EmojiAnimationType animationType;

  const EmojiLoading({
    Key? key,
    required this.emoji,
    this.size = 24.0,
    this.duration = 500,
    this.animationType = EmojiAnimationType.bounce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (animationType) {
      case EmojiAnimationType.bounce:
        return EmojiBounce(
          emoji: emoji,
          size: size,
          duration: duration,
        );
      case EmojiAnimationType.rotate:
        return EmojiRotate(
          emoji: emoji,
          size: size,
          duration: duration,
        );
      case EmojiAnimationType.pulse:
        return EmojiPulse(
          emoji: emoji,
          size: size,
          duration: duration,
        );
      case EmojiAnimationType.wave:
        return EmojiWave(
          emoji: emoji,
          size: size,
          duration: duration,
        );
    }
  }
}
