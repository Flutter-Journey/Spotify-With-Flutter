import 'package:flutter/material.dart';
import 'package:spotify_with_flutter/core/configs/theme/app_color.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height)),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          fontSize: 26,
        ),
      ),
    );
  }
}
