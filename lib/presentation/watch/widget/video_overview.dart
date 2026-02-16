import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  final String overiew;
  const VideoOverview({super.key, required this.overiew});

  @override
  Widget build(BuildContext context) {
    return Text(overiew, style: Theme.of(context).textTheme.bodyMedium);
  }
}
