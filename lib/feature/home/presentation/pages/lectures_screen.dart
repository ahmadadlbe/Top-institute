import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:top_institute/core/constant/app_router.dart';
import 'package:top_institute/core/constant/image_path.dart';
import 'package:top_institute/core/cubit_public/them_cubit.dart';
import 'package:top_institute/core/function/custom_show_model_bottom.dart';
import 'package:top_institute/core/storage/storage_handler.dart';
import 'package:top_institute/core/util/app_validator.dart';
import 'package:top_institute/core/widget/app_bar.dart';
import 'package:top_institute/core/widget/app_text.dart';
import 'package:top_institute/core/widget/app_text_field.dart';
import 'package:top_institute/core/widget/app_theme.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({super.key});

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
      // Adding an body to the Scaffold
      body: const Center(
        child: Text(
          'This is the Lectures Screen',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

Widget buildProfile(context) => Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Information User
              Row(
                children: [
                  // image user
                  const CircleAvatar(
                    radius: 25,
                    child: Icon(
                      Icons.person_outline,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 12),
                  //user Name and Number
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppCustomText(
                        text: 'Student #1',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 4),
                      AppCustomText(
                        text: '0933111111',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const Spacer(),
                  BlocBuilder<ThemeCubit, bool>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          context.read<ThemeCubit>().toggleTheme(!state);
                          if (!state) {
                            StorageHandler().setAppThem("dark");
                          } else {
                            StorageHandler().setAppThem("light");
                          }
                        },
                        icon: Icon(
                          state ? Icons.dark_mode : Icons.dark_mode_outlined,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const Divider(color: kColorGrey),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: IconButton(
                    onPressed: () {}, icon: Icon(Icons.person_2_outlined)),
                title: AppCustomText(
                  text: 'PROFILE',
                ),
                onTap: () {
                  customShowModalBottomSheet(
                      context: context,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20.h,
                        children: [
                          AppCustomText(text: "Profile", fontSize: 24.sp),
                          _buildReadOnlyTextField(
                              label: "Name", contentTextForm: "Student 1"),
                          _buildReadOnlyTextField(
                              label: "Phone", contentTextForm: "09331111111"),
                          _buildReadOnlyTextField(
                              label: "Email",
                              contentTextForm: "Stu1@gmail.com"),
                          _buildReadOnlyTextField(
                              label: "Birthdate",
                              contentTextForm: "2025_02_01"),
                          _buildCloseButton(context),
                        ],
                      ));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: IconButton(
                    onPressed: () {}, icon: Icon(Icons.lock_outline)),
                title: AppCustomText(
                  text: 'CHANGE PASSWORD',
                ),
                onTap: () {
                  customShowModalBottomSheet(
                      context: context,
                      widget: Column(
                        spacing: 10.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCustomText(
                              text: 'Change Password', fontSize: 24.sp),
                          AppCustomText(
                            text:
                                'Are you sure You want to change your Password ? ',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          AppCustomTextFormField(
                            maxLines: 1,
                            controller: TextEditingController(),
                            validator: AppValidator.passwordValidator,
                            isPass: true,
                            borderRadius: BorderRadius.circular(8.r),
                            hint: "Current Password",
                            prefixIcon: Icon(
                              Icons.lock_rounded,
                            ),
                            titleSize: 12.sp,
                          ),
                          AppCustomTextFormField(
                            maxLines: 1,
                            controller: TextEditingController(),
                            // validator: AppValidator.matchPassword("value1", "value2")  ,
                            isPass: true,
                            borderRadius: BorderRadius.circular(8.r),
                            hint: "New Password",
                            prefixIcon: Icon(
                              Icons.lock_rounded,
                            ),
                            titleSize: 12.sp,
                          ),
                          Row(
                            spacing: 10.w,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                color: kColorMain,
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide.none,
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: AppCustomText(
                                  text: "Cancel",
                                  colorText: kColorwhite,
                                ),
                              ),
                              MaterialButton(
                                color: kColorMain,
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide.none,
                                ),
                                minWidth: 40.w,
                                onPressed: () {},
                                child: AppCustomText(
                                  text: "Confirm",
                                  colorText: kColorwhite,
                                ),
                              )
                            ],
                          )
                        ],
                      ));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
                title: AppCustomText(
                  text: 'LOGOUT',
                ),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );

Widget _buildReadOnlyTextField(
    {required String label, required String contentTextForm}) {
  return AppCustomTextFormField(
    keyboardType: TextInputType.phone,
    contentPadding: EdgeInsetsDirectional.only(start: 10),
    controller: TextEditingController(text: contentTextForm),
    borderRadius: BorderRadius.circular(8.r),
    labelWidget: AppCustomText(text: label),
    readOnly: true,
    isPhone: true,
    maxLength: 10,
  );
}

Widget _buildCloseButton(BuildContext context) {
  return MaterialButton(
    color: kColorMain,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide.none,
    ),
    height: 42.h,
    minWidth: double.infinity,
    onPressed: () => context.pop(),
    child: AppCustomText(text: "Close", colorText: kColorwhite),
  );
}
