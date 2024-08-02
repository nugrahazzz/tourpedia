import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/config/routes/routes.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/constant/assets/lottie_assets.dart';
import 'package:tourpedia/core/utils/global_widgets/widgets.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';

class IntroduceChatPage extends StatelessWidget {
  const IntroduceChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(LottieAssets.chat,
                fit: BoxFit.cover, width: 60.0.wp, repeat: false),
            Text(
              "Butuh bantuan?",
              textAlign: TextAlign.center,
              style: TextStyles.poppinsBold.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 6.5.wp,
                color: ColorManager.primaryColor,
              ),
            ),
            SizedBox(
              height: 2.0.wp,
            ),
            Text(
              "AsistenQ dapat membantu segala kebutuhanmu terkait perjalanan.",
              textAlign: TextAlign.center,
              style: TextStyles.poppinsMedium.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 3.75.wp,
                color: ColorManager.bgDark.withOpacity(0.8),
              ),
            ),
            SizedBox(
              height: 6.0.wp,
            ),
            CustomButton(
              function: () {
                Get.offAndToNamed(Routes.chatGeminiPage);
              },
              width: 60.0.wp,
              title: "Memulai Obrolan",
              titleColor: ColorManager.white,
              color: ColorManager.primaryColor,
              borderRadius: 6.0.wp,
            ),
          ],
        ),
      ),
    );
  }
}
