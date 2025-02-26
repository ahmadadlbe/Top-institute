import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_institute/core/widget/app_theme.dart';

import 'app_button.dart';
import 'app_text.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.onTapYes,
    this.yesButton,
    this.title,
    this.yesWidget,
    this.onTapNo,
    this.findNo = true,
    this.findYes = true,
    this.titleWidget,
    this.yesText,
    this.noText,
  });

  final void Function()? onTapYes;
  final Widget? yesWidget;
  final Widget? titleWidget;
  final void Function()? onTapNo;
  final String? title;
  final String? yesText;
  final String? noText;
  final Color? yesButton;
  final bool findNo;
  final bool findYes;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      content: titleWidget,
      title: title != null
          ? AppCustomText(
              text: title!,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.start,
            )
          : null,
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (findNo)
                AppCustomButton(
                  colorText: kColorSecondaryText,
                  textSize: 14.sp,
                  textWidget: noText ?? "Cancel",
                  fontWeightText: FontWeight.w500,
                  onTap: onTapNo ?? () => Navigator.pop(context),
                ),
              if (findNo && findYes) SizedBox(width: 24.w),
              if (findYes)
                yesWidget ??
                    AppCustomButton(
                      colorText: Colors.red,
                      textSize: 14.sp,
                      textWidget: yesText ?? "Yes",
                      fontWeightText: FontWeight.w500,
                      onTap: onTapYes,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
