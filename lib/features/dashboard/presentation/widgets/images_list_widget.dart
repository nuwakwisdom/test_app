import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/constant/app_colors.dart';
import 'package:test_app/core/utils/fonts.dart';
import 'package:test_app/features/dashboard/presentation/notifier/dashboard_notifier.dart';

class ImagesListWidget extends StatelessWidget {
  const ImagesListWidget({
    super.key,
    required this.fromBreed,
  });
  final bool fromBreed;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, value, snapshot) {
      final images = value.imageList;
      return Column(
        children: [
          const Gap(10),
          fromBreed ? TextBold('Hounds') : TextBold('Hounds - afghan'),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                images?.length ?? 0,
                (index) {
                  return Container(
                      decoration: BoxDecoration(
                          color: AppColors.appWhite,
                          borderRadius: BorderRadius.circular(12)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          images?[index] ?? '',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
