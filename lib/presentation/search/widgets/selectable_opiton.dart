import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

class SelectableOpiton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const SelectableOpiton(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? AppColors.primary : AppColors.secondBackground),
        width: 90,
        height: 40,
        child: Center(child: Text(title)),
      ),
      onTap: onTap,
    );
  }
}
