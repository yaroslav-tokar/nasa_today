import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomVideoView extends StatelessWidget {
  const CustomVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 80,
        child: Center(
          child: Text(
            'video playback support in development...',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
