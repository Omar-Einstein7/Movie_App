import 'package:flutter/material.dart';

class VideoVoteAverage extends StatelessWidget {
  final double voteAverage;
  const VideoVoteAverage({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        Text(
          " ${voteAverage.toStringAsFixed(1)}",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
