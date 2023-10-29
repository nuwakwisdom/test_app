import 'package:flutter/material.dart';
import 'package:test_app/core/constant/app_colors.dart';
import 'package:test_app/core/utils/fonts.dart';

class SelectBreedButton extends StatelessWidget {
  const SelectBreedButton({super.key, this.type, this.onTap});
  final String? type;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.offWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: TextSemiBold(
              type ?? '',
            ),
          ),
        ),
      ),
    );
  }
}
