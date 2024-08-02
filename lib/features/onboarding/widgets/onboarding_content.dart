import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/onboarding/controller/onboarding_controller.dart';
import 'package:video_player/video_player.dart';

class OnboardingContent extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final String assetPath;

  const OnboardingContent({
    super.key,
    required this.number,
    required this.assetPath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();

    return ListView(
      children: [
        AspectRatio(
          aspectRatio:
              controller.videoPlayerController.value?.value.aspectRatio ?? 1.0,
          child: Obx(() => controller.isLoading.value
              ? Center(
                  child: SizedBox(
                    width: 8.0.wp,
                    height: 8.0.wp,
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      size: 8.0.wp,
                      color: Colors.teal,
                    ),
                  ),
                )
              : VideoPlayer(controller.videoPlayerController.value!)),
        ),
        SizedBox(
          height: 1.5.wp,
        ),
        Center(
          child: Text(
            title,
            style: TextStyles.poppinsBold.copyWith(
                fontSize: 5.2.wp,
                fontWeight: FontWeight.bold,
                color: ColorManager.bgDark.withOpacity(0.9)),
          ),
        ),
        SizedBox(
          height: 3.0.wp,
        ),
        Center(
          child: Text(
            description,
            style: TextStyles.poppinsRegular.copyWith(
                fontSize: 3.8.wp,
                fontWeight: FontWeight.normal,
                color: ColorManager.bgDark.withOpacity(0.9)),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
