import 'package:flutter/material.dart';
import 'package:payflow_flutterapp/shared/auth/auth_controller.dart';
import 'package:payflow_flutterapp/shared/themes/app_colors.dart';
import 'package:payflow_flutterapp/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.union)),
          Center(child: Image.asset(AppImages.logoFull))
        ],
      ),
    );
  }
}
