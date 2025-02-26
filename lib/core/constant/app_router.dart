import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:top_institute/feature/auth/login/presentation/pages/login_screen.dart';
import 'package:top_institute/feature/home/presentation/pages/home_screen.dart';
import 'package:top_institute/feature/notification/presentation/pages/notification_screen.dart';

// GoRouter configuration
class AppRouter {
  static String loginScreen = "/";
  static String homeScreen = "/homeScreen";
  static const stateSignupScreen = "/stateSignupScreen";
  static const notificationScreen = "/NotificationScreen";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: loginScreen,
        pageBuilder: (context, state) => customTransitionPage(
          key: state.pageKey,
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: homeScreen,
        pageBuilder: (context, state) => customTransitionPage(
          key: state.pageKey,
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: notificationScreen,
        pageBuilder: (context, state) => customTransitionPage(
          key: state.pageKey,
          child: NotificationScreen(),
        ),
      ),
    ],
  );
}

CustomTransitionPage customTransitionPage({
  required ValueKey<String> key,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
    },
  );
}

// FadeTransition(
//         opacity: Tween<double>(begin: 0, end: 1).animate(animation),
//         child: child,
//       );

// SlideTransition(
//         position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
//             .animate(animation),
//         // opacity: Tween<double>(begin: 0, end: 1).animate(animation),
//         child: child,
//       );

// ScaleTransition(
//   scale: Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: animation, curve: Curves.easeInBack)),

//   child: child,
// );
