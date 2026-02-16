import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

class SelectableOpiton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const SelectableOpiton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 90,
        height: 40,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
