import 'package:flutter/material.dart';
import 'package:spotify_with_flutter/common/helpers/is_dark_mode.dart';
import 'package:spotify_with_flutter/core/configs/theme/app_color.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.03),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: context.isDarkMode
                ? AppColors.white.withOpacity(0.03)
                : AppColors.dark.withOpacity(0.04),
          ),
        ),
      ),
    );
  }
}
