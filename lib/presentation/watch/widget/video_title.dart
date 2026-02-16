import 'package:flutter/material.dart';

class VideoTitle extends StatelessWidget {
  final String title;
  const VideoTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
