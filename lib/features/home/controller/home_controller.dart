import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/app/function.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';

class HomeController extends GetxController {
  //
  late PageController pageController;
  var selectedIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex.value);
  }

  @override
  onReady() {
    super.onReady();
    systemBarColor(ColorManager.white, ColorManager.white);
  }

  void onButtonPressed(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(selectedIndex.value,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOutQuad);
    refresh();
  }
}
