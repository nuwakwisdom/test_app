import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app/core/constant/constant.dart';
import 'package:test_app/core/sl/sl_container.dart';
import 'package:test_app/features/dashboard/presentation/notifier/dashboard_notifier.dart';
import 'package:test_app/features/dashboard/presentation/widgets/dog_type_button.dart';
import 'package:test_app/features/dashboard/presentation/widgets/images_list_widget.dart';
import 'package:test_app/features/dashboard/presentation/widgets/radom_image_widget.dart';
import 'package:test_app/features/dashboard/presentation/widgets/select_bree_button.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String selectedType = 'Random image by breed';
  bool isRandomImageDisplayed = true;
  bool forBreed = true;
  bool listfromBreed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(30),
              DogTypeButton(
                key: const Key('Choose Type'),
                breedType: selectedType,
                onTap: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12))),
                      context: context,
                      builder: (context) {
                        return Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                            color: AppColors.appWhite,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Gap(40),
                                SelectBreedButton(
                                    type: 'Random image by breed',
                                    onTap: () {
                                      setState(() {
                                        selectedType = 'Random image by breed';
                                        forBreed = true;

                                        isRandomImageDisplayed = true;
                                        sl<HomeNotifier>()
                                            .getRandomImageByBreed(context);
                                        Navigator.pop(context);
                                      });
                                    }),
                                const Gap(10),
                                SelectBreedButton(
                                    type: 'Images list by breed',
                                    onTap: () async {
                                      setState(() {
                                        selectedType = 'Images list by breed';
                                        isRandomImageDisplayed = false;
                                        listfromBreed = true;
                                        sl<HomeNotifier>()
                                            .getImageListByBreed(context);
                                        Navigator.pop(context);
                                      });
                                    }),
                                const Gap(10),
                                SelectBreedButton(
                                    type: 'Random image by breed and sub breed',
                                    onTap: () {
                                      setState(() {
                                        selectedType =
                                            'Random image by breed and sub breed';
                                        isRandomImageDisplayed = true;
                                        forBreed = false;

                                        sl<HomeNotifier>()
                                            .getRandomImageBySubBreed(context);
                                        Navigator.pop(context);
                                      });
                                    }),
                                const Gap(10),
                                SelectBreedButton(
                                    type: 'Images list by breed and sub breed',
                                    onTap: () {
                                      setState(() {
                                        selectedType =
                                            'Images list by breed and sub breed';
                                        isRandomImageDisplayed = false;
                                        listfromBreed = false;
                                        sl<HomeNotifier>()
                                            .getImageListBySubBreed(context);
                                        Navigator.pop(context);
                                      });
                                    }),
                                const Gap(20),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
              const Gap(30),
              isRandomImageDisplayed
                  ? Expanded(
                      child: RandomImageWidget(
                      forBreed: forBreed,
                    ))
                  : Expanded(
                      child: ImagesListWidget(
                      fromBreed: listfromBreed,
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
