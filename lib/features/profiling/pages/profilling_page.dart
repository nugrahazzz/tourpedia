import 'package:bounce/bounce.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:refreshed/get_state_manager/get_state_manager.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/constant/assets/image_assets.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/profiling/controller/profiling_controller.dart';
import 'package:tourpedia/features/profiling/pages/component/add_username.dart';
import 'package:tourpedia/features/profiling/pages/component/choose_avatar.dart';
import 'package:tourpedia/features/profiling/pages/component/pick_destination.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfilingPage extends GetView<ProfilingController> {
  const ProfilingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              AddUsernamePage(),
              ChooseAvatarPage(),
              PickDestinationPage(),
            ],
          ),
          Positioned(
            top: 18.0.wp,
            right: 6.0.wp,
            child: SmoothPageIndicator(
              axisDirection: Axis.vertical,
              controller: controller.pageController, // PageController
              count: 3,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  rotationAngle: 0,
                  verticalOffset: 0,
                  color: Colors.teal,
                  height: 3.5.wp,
                  width: 3.5.wp,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  dotBorder: DotBorder(
                      color: Colors.teal,
                      padding: 0.75.wp,
                      type: DotBorderType.none),
                ),
                dotDecoration: DotDecoration(
                  rotationAngle: 0,
                  color: ColorManager.bgDark.withOpacity(0.7),
                  height: 2.5.wp,
                  width: 2.5.wp,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
              ), // Your preferred effect
            ),
          ),
          Positioned(
            right: 5.0.wp,
            bottom: 6.0.wp,
            child: Bounce(
              duration: const Duration(milliseconds: 500),
              onTap: () {
                controller.continueButton();
              },
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.5.wp,
                      ),
                      Text(
                        "Lanjutkan",
                        style: TextStyles.poppinsSemiBold.copyWith(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.6,
                            color: ColorManager.bgDark.withOpacity(0.8)),
                      ),
                      SizedBox(
                        height: 1.0.wp,
                      ),
                      Image.asset(
                        ImageAssets.dashedLine,
                        height: 6.0.wp,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 6.0.wp,
                  ),
                  DottedBorder(
                    color: ColorManager.bgDark,
                    borderType: BorderType.Oval,
                    strokeWidth: 2,
                    dashPattern: const [10, 10],
                    child: Container(
                      margin: EdgeInsets.all(1.0.wp),
                      width: 16.0.wp,
                      height: 16.0.wp,
                      decoration: BoxDecoration(
                        color: ColorManager.bgDark,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.keyboard_double_arrow_right_sharp,
                        color: Colors.white,
                        size: 8.0.wp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
