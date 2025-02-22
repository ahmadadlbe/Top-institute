import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({
    super.key,
    this.width,
    this.height,
    this.colorButton,
    this.onTap,
    this.radius,
    this.textWidget = "",
    this.iconWidget,
    this.colorText,
    this.padding,
    this.padingVertical = 0,
    this.padingHorizontal = 0,
    this.textSize,
    this.fontWeightText,
    this.widget,
    this.colorBorder,
  });

  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final double? textSize;
  final double? padingVertical;
  final double? padingHorizontal;
  final FontWeight? fontWeightText;
  final Color? colorButton;
  final Color? colorBorder;
  final Color? colorText;
  final String textWidget;
  final IconData? iconWidget;
  final Widget? widget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: colorBorder ?? Colors.transparent),
          borderRadius: BorderRadius.circular(radius ?? 10.sp),
          color: colorButton,
        ),
        width: width,
        height: height,
        child: widget ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (iconWidget != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: Icon(
                          iconWidget,
                          color: colorText ??
                              Theme.of(context).textTheme.headlineMedium!.color,
                        ),
                      )
                    : const SizedBox()),
                AppCustomText(
                  text: textWidget,
                  fontSize: textSize ?? 20.sp,
                  colorText: colorText ??
                      Theme.of(context).textTheme.headlineMedium!.color,
                  fontWeight: fontWeightText,
                ),
              ],
            ),
      ),
    );
  }
}
