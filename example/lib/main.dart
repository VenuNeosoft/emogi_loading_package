import 'package:flutter/material.dart';
import 'package:emoji_loading/emoji_loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EmojiLoadingDemo(),
    );
  }
}

class EmojiLoadingDemo extends StatelessWidget {
  const EmojiLoadingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emoji Loading Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          EmojiLoading(emoji: '🔥', size: 50, duration: 700, animationType: EmojiAnimationType.bounce),
          SizedBox(height: 20),
          EmojiLoading(emoji: '⚡', size: 50, duration: 700,animationType: EmojiAnimationType.rotate),
          SizedBox(height: 20),
          EmojiLoading(emoji: '❤️', size: 50, duration: 700,animationType: EmojiAnimationType.pulse),
          SizedBox(height: 20),
          EmojiLoading(emoji: '🌊', size: 50, duration: 700, animationType: EmojiAnimationType.wave),
        ],
      ),
    );
  }
}
