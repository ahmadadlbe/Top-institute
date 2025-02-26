import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_institute/core/widget/app_theme.dart';

customShowModalBottomSheet({
  required BuildContext context,
  required Widget widget,
}) {
  showModalBottomSheet<void>(
      context: context,
      elevation: 0,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                    spacing: 20.h,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 100.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: kColorTextGrey400,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      widget,
                    ])));
      });
}
