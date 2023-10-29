import 'package:flutter/material.dart';
import 'package:test_app/core/constant/app_colors.dart';
import 'package:test_app/core/navigator/route_name.dart';
import 'package:test_app/core/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RouteName.dashboard);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: TextBold(
          'Test App',
          fontSize: 18,
          color: AppColors.appWhite,
        ),
      ),
    );
  }
}
