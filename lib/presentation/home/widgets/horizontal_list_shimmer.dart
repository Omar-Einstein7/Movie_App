import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/loading/app_shimmer.dart';

class HorizontalListShimmer extends StatelessWidget {
  const HorizontalListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return const AppShimmer(
            width: 150,
            height: 300,
            radius: 16,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 5,
      ),
    );
  }
}
