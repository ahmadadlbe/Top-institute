import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:top_institute/core/constant/app_router.dart';
import 'package:top_institute/core/constant/image_path.dart';
import 'package:top_institute/core/widget/app_bar.dart';
import 'package:top_institute/feature/home/presentation/pages/lectures_screen.dart';

class MarksScreen extends StatelessWidget {
  const MarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // Adding  an AppBar to the Scaffold
      appBar: CustomAppBar(
          logoPath: isDarkMode ? kImageLogoBlack : kImageLogoWhite,
          notificationCount: 12,
          onNotificationTap: () {
            context.push(AppRouter.notificationScreen);
          }),
      // Adding an endDrawer to the Scaffold
      drawer: buildProfile(context),
      body: const Center(
        child: Text(
          'This is the Marks Screen',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
