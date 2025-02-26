import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_institute/core/widget/app_text.dart';
import 'package:top_institute/core/widget/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String logoPath;
  final VoidCallback onNotificationTap;
  final int notificationCount;

  const CustomAppBar({
    super.key,
    required this.logoPath,
    required this.onNotificationTap,
    this.notificationCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: kColorGrey200,
      title: CircleAvatar(
        backgroundImage: AssetImage(logoPath),
        radius: 20.r,
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
              ),
              onPressed: onNotificationTap,
            ),
            if (notificationCount > 0)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  // padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 18.w,
                    minHeight: 12.h,
                  ),
                  child: AppCustomText(
                    text: '$notificationCount',
                    textAlign: TextAlign.center,
                    colorText: kColorwhite,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
