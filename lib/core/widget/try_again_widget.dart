import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_institute/core/widget/app_theme.dart';

import 'app_text.dart';

class TryAgainWidget extends StatelessWidget {
  final VoidCallback onTap;
  const TryAgainWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppCustomText(
            text: "Try Again",
            colorText: kColorBlack,
            fontSize: 20.sp,
          ),
          Icon(
            Icons.refresh,
            size: 35.sp,
            color: kColorMain,
          ),
        ],
      ),
    );
  }
}
