import 'package:flutter/material.dart';

class VideoReleaseDate extends StatelessWidget {
  final DateTime releaseDate;
  const VideoReleaseDate({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_month,
          size: 20,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        Text(
          " ${releaseDate.toString().split(" ")[0]}" ,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6)),
        )
      ],
    );
  }
}
