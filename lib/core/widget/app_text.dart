import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppCustomText extends StatelessWidget {
  final String text;
  final Color? colorText;
  final TextDirection? textDirection;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? verticalPadding;
  final double? horizontalPadding;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final int? maxLines;

  const AppCustomText({
    super.key,
    required this.text,
    this.colorText,
    this.textDirection,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.verticalPadding = 1,
    this.horizontalPadding = 1,
    this.textAlign,
    this.textOverflow,
    this.textDecorationColor,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding!,
        horizontal: horizontalPadding!,
      ),
      child: Text(
        text.tr(),
        // textDirection: textDirection,
        style: TextStyle(
          decorationColor: textDecorationColor,
          decoration: textDecoration,
          fontSize: fontSize,
          color: colorText,
          fontWeight: fontWeight,
          fontFamily: "Poppins",
          // height: 1,
        ),
        textAlign: textAlign,
        overflow: textOverflow,
        softWrap: true,
        maxLines: maxLines,
      ),
    );
  }
}
