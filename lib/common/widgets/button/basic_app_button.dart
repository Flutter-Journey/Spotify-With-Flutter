import 'package:flutter/material.dart';
import 'package:spotify_with_flutter/core/configs/theme/app_color.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;
  final double textSize;
  final FontWeight weight;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height = 70,
    this.textSize = 26,
    this.weight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height)),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: weight,
          color: AppColors.white,
          fontSize: textSize,
        ),
      ),
    );
  }
}
