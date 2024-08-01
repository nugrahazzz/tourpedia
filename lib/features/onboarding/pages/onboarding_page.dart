import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/app/function.dart';
import 'package:tourpedia/features/onboarding/controller/onboarding_controller.dart';

import 'widgets/next_page_button.dart';
import 'widgets/onboarding_page_indicator.dart';
import 'widgets/ripple.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    systemBarColor(Colors.white, Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(
          children: <Widget>[
            Container(
              width: 100.0.wp,
              padding: EdgeInsets.only(
                  right: 8.0.wp, left: 8.0.wp, top: 16.0.wp, bottom: 8.0.wp),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: controller.getPage()),
                  AnimatedBuilder(
                    animation: controller.pageIndicatorAnimation,
                    builder: (_, Widget? child) {
                      return OnboardingPageIndicator(
                        angle: controller.pageIndicatorAnimation.value,
                        currentPage: controller.currentPage.value,
                        colors: Colors.teal,
                        child: child!,
                      );
                    },
                    child: NextPageButton(
                      onPressed: controller.nextPage,
                      colors: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: controller.rippleAnimation,
              builder: (_, Widget? child) {
                return Ripple(
                  radius: controller.rippleAnimation.value,
                  color: Colors.white,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
