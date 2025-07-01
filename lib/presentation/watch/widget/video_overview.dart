import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  final String overiew;
  const VideoOverview({super.key, required this.overiew});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "OverView",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(overiew, style: Theme.of(context).primaryTextTheme.bodyMedium)
      ],
    );
  }
}
