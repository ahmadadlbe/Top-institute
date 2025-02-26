import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color kColorScaffold = Color(0xffffffff);
const Color kColorImageAuth1 = Color(0xFF34081A);
const Color kColorBase = Color(0xffF7F7F7);
const Color kColorImageAuth2 = Color(0xFF891645);
const Color kColorblack = Color(0xff333333);
const Color kColorMain = Color(0xff578FCA);
const Color kColorMainOpacity = Color(0xfff6d1dd);
const Color kColorOrangeOpacity = Color(0xfffef0ef);
const Color kColorOrange = Colors.orange;
const Color kColorRed = Colors.red;
Color? kColorgreenlight = Colors.green[300];
const Color kColorYellow = Colors.yellow;
const Color kColorwhite = Colors.white;
Color? kColorPurpleLight = Colors.purple[200];
Color? kColordeepPurpleLight = Colors.deepPurple[50];
Color? kColorPurpleOpacity = const Color(0xffffeffc);
Color? kColorPurple = Colors.purple;
Color? kColordeepPurple = Colors.purple[600];
const Color kColorBlack54 = Colors.black54;
const Color kColorBlack87 = Colors.black87;
const Color kColorBlack12 = Colors.black12;
const Color kColorBlack = Colors.black;
const Color kColorHomeContainer = Color(0xff1f1f1f);
const Color kColorGrey = Color(0xffE6E6E6);
Color? kColorGrey2 = const Color(0xff999999);
Color? kColorGrey200 = Colors.grey[200];
Color? kColorGrey300 = Colors.grey[300];
Color? kColorTextGrey400 = Colors.grey[400];
Color? kColorTextGrey850 = Colors.grey[850];
Color? kColorBlue900 = Colors.blue[900];
Color kShimmerBaseColor = Colors.grey[300]!;
Color kShimmerHighlightColor = Colors.grey[100]!;
const Color kColorBlueLight = Color.fromARGB(255, 241, 248, 253);
const Color kColorCategorisTab = Color(0xffF3F6FB);
const Color kColorSliderDisable = Color(0xff9b9b9b);

const Color kColorTitleText = Color(0xff1C1C28);
Color? kColorTextGreySubTitle = const Color(0xff525252);
Color? kColorPrimaryText = const Color(0xFF1F1F1F);
Color? kColorButtonDisable = const Color(0xffF2F2F5);
Color? kColorButtonTextDisable = const Color(0xff8F90A6);
//====================================================================================================
const Color kColorPlaceholder = Color(0xff9B9B9B);
const Color kColorPlaceholder2 = Color(0xffF1F1F1);
const Color kColorDivider = Color(0xffC7C9D9);
const Color kColorMainRed = Color(0xffd90217);
const Color kColorOffWhite = Color(0xFFE9E9E9);
const Color kColorOffGray = Color(0xff9E9E9E);
const Color kColorWhite = Color(0xffFFFFFF);
const Color kColorOffBlack = Color(0xff333333);
const Color kColorGreen = Color(0xff27FF97);
const Color kColorGreyOriginal = Colors.grey;
const Color kColorSecondaryText = Color(0xFF666666);
const Color kColorTertiaryText = Color(0xFF9E9E9E);
const Color kColoriconButtonShadow = Color(0xff0000002e);
const cardDarkColor = Color(0xff333333);
const primaryDarkColor = Color(0xff242527);
Color shimmerColor = Colors.grey[100]!;
Color shimmerDarkColor = const Color.fromARGB(255, 62, 62, 62);
const schemePrimaryDarkColor = kColorMain;
const selectionHandleDarkColor = kColorMain;
const primaryColor = Color(0xffF5FAFF);
const secondaryColor = Color(0xff51eec2);
const textColor = Color(0xff000000);
const textDarkColor = Color(0xffFFFFFF);
const textBodyColor = Color(0xffFFFFFF);
const textBodyDarkColor = Color(0xffFFFFFF);
const textFormFieldDarkColor = Color(0xff333333);
const textFormFieldColor = Color(0xffFFFFFF);
const iconDarkColor = Color(0xffFFFFFF);
const iconColor = Color(0xff000000);
const schemePrimaryColor = kColorMain;
const selectionHandleColor = kColorMain;
Color kColoriconFavorite = Color(0xffF7F7F7).withValues(
  alpha: 0.8,
);
const Color kGreen = Color(0xff799E6E);
Color kColorMainWithOpacity = Color(0xff695CD9).withValues(alpha: .25);

ThemeData getDarkThem(BuildContext context) {
  return ThemeData(
    fontFamily: context.locale.languageCode == "ar" ? "NotoNaskhArabic" : "REM",
    cardColor: cardDarkColor,
    scaffoldBackgroundColor: primaryDarkColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: primaryDarkColor,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: kColorBlack),
        actionsIconTheme: IconThemeData(
          color: kColorBlack,
        )),
    brightness: Brightness.dark,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: selectionHandleDarkColor,
      cursorColor: selectionHandleDarkColor,
      selectionHandleColor: selectionHandleDarkColor,
    ),
    primaryColor: primaryDarkColor,
    colorScheme: ColorScheme.dark(
      primary: schemePrimaryDarkColor,
      surfaceTint: Colors.white,
      secondary: shimmerDarkColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(kColorMain),
    )),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    textTheme: const TextTheme(
        labelMedium: TextStyle(color: textDarkColor),
        headlineMedium: TextStyle(color: textBodyDarkColor)),
    iconTheme: const IconThemeData(color: iconDarkColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: textFormFieldDarkColor,
      floatingLabelStyle: const TextStyle(color: primaryColor),
      iconColor: secondaryColor,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: secondaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

ThemeData getLightThem(BuildContext context) {
  return ThemeData(
    fontFamily: context.locale.languageCode == "ar" ? "NotoNaskhArabic" : "REM",
    scaffoldBackgroundColor: kColorwhite,
    appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
        actionsIconTheme: IconThemeData(
          color: kColorBlack,
        )),
    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: selectionHandleColor,
      cursorColor: selectionHandleColor,
      selectionHandleColor: selectionHandleColor,
    ),
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: schemePrimaryColor,
      surfaceTint: Colors.black,
      secondary: shimmerColor,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    iconTheme: const IconThemeData(color: iconColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: textFormFieldColor,
      floatingLabelStyle: const TextStyle(color: kColorBlack),
      iconColor: secondaryColor,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: secondaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
