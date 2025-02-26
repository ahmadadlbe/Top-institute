import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_institute/core/widget/app_text.dart';
import 'package:top_institute/core/widget/app_theme.dart';

customShowSnackBar({
  required BuildContext context,
  required String message,
  Color? color,
  bool isTop = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: isTop ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
    margin:
        isTop ? EdgeInsets.symmetric(horizontal: 15.w, vertical: 68.h) : null,
    content: SafeArea(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        // height: 80.h,
        // width: ,
        decoration: BoxDecoration(
          color: color ?? kColorMain,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: AppCustomText(
          maxLines: 4,
          text: message,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  ));
}
