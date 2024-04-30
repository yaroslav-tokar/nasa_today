import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class FadeInTextView extends StatelessWidget {
  const FadeInTextView({
    required this.text,
    this.duration = const Duration(milliseconds: 350),
    super.key,
  });

  final String text;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Animator(
      duration: duration,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, animatorState, child) {
        return Opacity(
          opacity: animatorState.value,
          child: child,
        );
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
