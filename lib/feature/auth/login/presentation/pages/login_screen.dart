import 'package:flutter/material.dart';
import 'package:top_institute/core/widget/app_theme.dart';
import 'package:top_institute/feature/auth/login/presentation/widget/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomLoginBody(),
    );
  }
}
