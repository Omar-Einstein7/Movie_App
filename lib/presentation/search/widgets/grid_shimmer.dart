import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/loading/app_shimmer.dart';

class GridShimmer extends StatelessWidget {
  const GridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const AppShimmer(
          width: double.infinity,
          height: double.infinity,
          radius: 16,
        );
      },
    );
  }
}
