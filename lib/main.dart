import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_institute/core/cubit_public/them_cubit.dart';
import 'package:top_institute/core/storage/storage_handler.dart';
import 'package:top_institute/core/widget/app_theme.dart';
import 'core/constant/app_router.dart';
import 'injection_container.dart' as di;

// FirebaseMessaging messaging = FirebaseMessaging.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  await di.init();
  // LocalNotificationService.initialize();
  // await _initFirebaseMessaging();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await StorageHandler().init();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => EasyLocalization(
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        path: 'assets/translations',
        child: const MyApp(),
      ),
    ),
  );
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   LocalNotificationService.display(message);
//   print("aaaaaaaaaaaaafiiiiiiiiiiiiiiiiiiii");
// }

// Future<void> _initFirebaseMessaging() async {
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );

//   print('User granted permission: ${settings.authorizationStatus}');
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     LocalNotificationService.display(message);
//     print("aaaaaaaaaaaaafiiiiiiiiiiiiiiiiiiii");

//     if (message.notification != null) {}
//   });
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<ThemeCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocBuilder<ThemeCubit, bool>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: getLightThem(context),
                darkTheme: getDarkThem(context),
                // themeMode: ThemeMode.dark,
                themeMode: StorageHandler().appTheme == null
                    ? ThemeMode.system
                    : state
                        ? ThemeMode.dark
                        : ThemeMode.light,
                title: 'Top institute',
                routerConfig: AppRouter.router,
                localizationsDelegates: context.localizationDelegates,
                locale: context.locale,
                supportedLocales: context.supportedLocales,
              );
            },
          );
        },
      ),
    );
  }
}
