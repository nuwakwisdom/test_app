import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/sl/sl_container.dart';
import 'package:test_app/core/utils/fonts.dart';
import 'package:test_app/features/dashboard/presentation/notifier/dashboard_notifier.dart';
import 'package:test_app/features/dashboard/presentation/widgets/next_button.dart';

class RandomImageWidget extends StatefulWidget {
  const RandomImageWidget({super.key, required this.forBreed});
  final bool forBreed;
  @override
  State<RandomImageWidget> createState() => _RandomImageWidgetState();
}

class _RandomImageWidgetState extends State<RandomImageWidget> {
  Future<void> getRandomImage() async {
    await sl<HomeNotifier>().getRandomImageByBreed(context);
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, getRandomImage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, value, snapshot) {
      final image = value.imageEntity?.message;
      return SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            const Gap(20),
            widget.forBreed ? TextBold('Hounds') : TextBold('Hounds - afghan'),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: image == '' || image == null
                    ? const SizedBox()
                    : Image.network(
                        image,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            const Gap(20),
            AppButton(
              title: 'Next',
              onTap: widget.forBreed
                  ? () async {
                      await sl<HomeNotifier>().getRandomImageByBreed(context);
                    }
                  : () async {
                      await sl<HomeNotifier>()
                          .getRandomImageBySubBreed(context);
                    },
            )
          ],
        ),
      );
    });
  }
}
