import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

class CategoryText extends StatelessWidget {
  final String title;
  const CategoryText({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'See All',
              style: TextStyle(color: AppColors.primary, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
