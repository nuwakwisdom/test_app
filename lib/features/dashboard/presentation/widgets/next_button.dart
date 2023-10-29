import 'package:flutter/material.dart';
import 'package:test_app/core/constant/constant.dart';
import 'package:test_app/core/utils/fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryColor),
        child: Center(
          child: TextBold(
            title,
            fontSize: 14,
            color: AppColors.offWhite,
          ),
        ),
      ),
    );
  }
}
