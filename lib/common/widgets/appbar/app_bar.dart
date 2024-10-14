import 'package:flutter/material.dart';
import 'package:spotify_with_flutter/common/helpers/is_dark_mode.dart';
import 'package:spotify_with_flutter/core/configs/theme/app_color.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool hiveBack;

  const BasicAppBar({
    super.key,
    this.hiveBack = false,
    this.title = const Text(''),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: hiveBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? AppColors.white.withOpacity(0.03)
                      : AppColors.dark.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: context.isDarkMode ? AppColors.white : AppColors.dark,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
