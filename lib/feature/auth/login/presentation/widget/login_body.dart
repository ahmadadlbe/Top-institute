import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:top_institute/core/constant/app_router.dart';
import 'package:top_institute/core/constant/image_path.dart';
import 'package:top_institute/core/util/app_validator.dart';
import 'package:top_institute/core/widget/app_text.dart';
import 'package:top_institute/core/widget/app_text_field.dart';
import 'package:top_institute/core/widget/app_theme.dart';

class CustomLoginBody extends StatelessWidget {
  const CustomLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    final isDarkMode =
        Theme.of(context).brightness == Brightness.dark; // isDark
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          spacing: 15.h,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150.h),
            Center(
              child: Image.asset(
                isDarkMode ? kImageLogoBlack : kImageLogoWhite,
                width: 100.w,
                height: 100.h,
              ),
            ),
            AppCustomText(
              text: "Top Institute",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            AppCustomText(
              text:
                  "Trust in Top and rest assured about your children’s future while you are at lectures",
              textAlign: TextAlign.center,
              fontSize: 14,
            ),
            AppCustomTextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              validator: AppValidator.phoneValidator,
              borderRadius: BorderRadius.circular(8.r),
              hint: "Phone Number",
              prefixIcon: Icon(
                Icons.call,
              ),
              isPhone: true,
              maxLength: 10,
              titleSize: 12.sp,
            ),
            AppCustomTextFormField(
              maxLines: 1,
              controller: passwordController,
              validator: AppValidator.passwordValidator,
              isPass: true,
              borderRadius: BorderRadius.circular(8.r),
              hint: "Password",
              prefixIcon: Icon(
                Icons.lock_rounded,
              ),
              titleSize: 12.sp,
            ),
            MaterialButton(
              color: kColorMain,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
              height: 42.h,
              minWidth: double.infinity,
              onPressed: () {
                context.pushReplacement(AppRouter.homeScreen);
              },
              child: AppCustomText(
                text: "LOGIN",
                colorText: kColorwhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
