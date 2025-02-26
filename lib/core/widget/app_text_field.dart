import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_institute/core/widget/app_theme.dart';
import 'app_text.dart';

class AppCustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;

  final String? lable;
  final Widget? icon;
  final int? maxLength;
  final int? maxLines;
  final bool isPass;
  final bool isPhone;
  final bool isfilled;
  final Color? passIconColor;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Widget? prefixIcon;
  final Widget? labelWidget;
  final EdgeInsets? padding;
  final bool readOnly;
  final Color? colorHint;
  final Color? colorLable;
  final Color? fillColor;
  final Color? textColor;
  final double? fontSize;
  final double? hintfontSize;
  final FontWeight? hintFontWeight;
  final void Function(String)? onChanged;
  final String? title;
  final double? titleSize;
  final double? height;
  final FontWeight? titleBold;
  final EdgeInsetsDirectional? contentPadding;
  final bool isRequired;
  final String? initialSelection;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;

  const AppCustomTextFormField({
    super.key,
    this.controller,
    this.hint,
    this.lable,
    this.icon,
    this.keyboardType,
    this.isPass = false,
    this.passIconColor,
    this.validator,
    this.borderRadius,
    this.borderColor,
    this.padding,
    this.prefixIcon,
    this.readOnly = false,
    this.onChanged,
    this.title,
    this.titleSize,
    this.titleBold,
    this.colorHint,
    this.hintFontWeight,
    this.textColor,
    this.colorLable,
    this.fillColor,
    this.contentPadding,
    this.isRequired = true,
    this.isfilled = false,
    this.fontSize,
    this.hintfontSize,
    this.labelWidget,
    this.isPhone = false,
    this.onTap,
    this.maxLength,
    this.maxLines,
    this.initialSelection,
    this.onFieldSubmitted,
    this.height,
    this.focusNode,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppCustomTextFormField> {
  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          widget.title != null
              ? Row(
                  children: [
                    AppCustomText(
                      text: widget.title!,
                      fontSize: widget.titleSize ?? 12.sp,
                      fontWeight: widget.titleBold,
                      colorText: widget.textColor,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          widget.title != null ? SizedBox(height: 4.h) : SizedBox.shrink(),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 42.h),
            child: TextFormField(
              cursorColor: kColorMain,
              focusNode: widget.focusNode,
              textAlign: widget.isPhone && context.locale.languageCode == "ar"
                  ? TextAlign.end
                  : TextAlign.start,
              inputFormatters: widget.maxLength != null
                  ? [LengthLimitingTextInputFormatter(widget.maxLength)]
                  : null,
              maxLines: widget.maxLines ?? 1,
              onTap: widget.onTap,
              onChanged: widget.onChanged,
              style: TextStyle(
                fontSize: widget.fontSize ?? 16.sp,
                color: widget.textColor ??
                    Theme.of(context).textTheme.labelMedium!.color,
                fontWeight: FontWeight.normal,
                fontFamily: "Poppins",
              ),
              readOnly: widget.readOnly,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: widget.controller,
              validator: widget.validator,
              decoration: InputDecoration(
                label: widget.labelWidget,

                filled: widget.isfilled,
                hintStyle: TextStyle(
                  color: widget.colorHint,
                  fontSize: widget.hintfontSize ?? 14.sp,
                  fontWeight: widget.hintFontWeight,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? kColorTertiaryText,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? kColorTertiaryText,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? kColorTertiaryText,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? kColorTertiaryText,
                  ),
                ),
                fillColor: widget.fillColor ?? kColorwhite,
                contentPadding:
                    widget.contentPadding ?? EdgeInsetsDirectional.all(0),
                labelText: widget.lable,
                labelStyle:
                    TextStyle(color: widget.colorLable, fontFamily: "Poppins"),
                hintText: widget.hint?.tr(),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.icon ??
                    (widget.isPass
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _hide = !_hide;
                              });
                            },
                            icon: _hide
                                ? Icon(Icons.visibility_off,
                                    size: 18.sp, color: widget.passIconColor)
                                : Icon(Icons.visibility,
                                    size: 18.sp, color: widget.passIconColor),
                          )
                        : null),
                // isDense: true,
              ),
              obscureText: widget.isPass && _hide,
              keyboardType: widget.keyboardType,
              onFieldSubmitted: widget.onFieldSubmitted,
            ),
          ),
          widget.title != null
              ? SizedBox(height: 2.5.w)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
