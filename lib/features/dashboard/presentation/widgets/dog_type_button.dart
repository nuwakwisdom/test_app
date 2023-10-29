import 'package:flutter/material.dart';
import 'package:test_app/core/constant/app_colors.dart';
import 'package:test_app/core/utils/fonts.dart';

class DogTypeButton extends StatefulWidget {
  const DogTypeButton(
      {required super.key, required this.breedType, required this.onTap});
  final String breedType;
  final VoidCallback onTap;
  @override
  State<DogTypeButton> createState() => _DogTypeButtonState();
}

class _DogTypeButtonState extends State<DogTypeButton> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.offWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextSemiBold(
                  widget.breedType,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
