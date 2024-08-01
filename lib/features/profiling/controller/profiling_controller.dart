import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notion_avatar/flutter_notion_avatar_controller.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/config/routes/routes.dart';
import 'package:tourpedia/core/app/function.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class ProfilingController extends GetxController {
  late PageController pageController;
  int currentPage = 0;

  //Add Username
  String name = ""; //fullname
  late TextEditingController nameTEF;
  late FocusNode nameFN;

  //Add avatar
  late Uint8List avatarBytes; //avatar user
  NotionAvatarController? notionAvatarC;

  WidgetsToImageController widgetsToImageController =
      WidgetsToImageController();

  //Add favorite destination
  late RxList<bool> selectedTopics = [
    true, //Pegunungan
    false, //Pantai
    true, //Gua
    false, //Danau
    false, //Museum
    false, //Taman Nasional
    true, //Situs Sejarah dan Budaya
    false, //Air Terjun
  ].obs;

  @override
  onInit() {
    pageController = PageController();
    //
    nameFN = FocusNode();
    nameTEF = TextEditingController();
    //
    super.onInit();
  }

  @override
  onReady() {
    super.onReady();
    systemBarColor(ColorManager.white, ColorManager.white);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  //select favorite destination
  void toggleSelection(int index) {
    selectedTopics[index] = !selectedTopics[index];
    selectedTopics.refresh();
  }

  //saving avatar
  void saveAvatar() async {
    nextPage();
    avatarBytes = (await widgetsToImageController.capture())!;
    final kb = avatarBytes.lengthInBytes / 1024;

    if (kDebugMode) {
      print(kb);
    }
  }

  //saving name
  void saveName() {
    nameFN.unfocus();

    if (!(nameTEF.text.length < 4)) {
      name = nameTEF.text;
      nextPage();
    } else {
      nameFN.requestFocus();
    }
  }

  void continueButton() {
    if (currentPage == 0) {
      saveName();
    } else if (currentPage == 1) {
      saveAvatar();
    } else if (currentPage == 2) {
      Get.offAllNamed(Routes.homePage);
    }
  }

  void nextPage() {
    Future.delayed(const Duration(milliseconds: 500), () {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }
}
