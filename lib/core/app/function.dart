import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/global_widgets/widgets.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showSnackBar({required String title, required String description}) {
  Get.snackbar(
    "", "",
    titleText: Padding(
      padding: EdgeInsets.only(left: 3.0.wp),
      child: Text(
        title,
        style: TextStyles.poppinsMedium.copyWith(
          color: ColorManager.white,
          fontSize: 3.2.wp,
          wordSpacing: 0.3,
          letterSpacing: 0.3,
        ),
      ),
    ),

    messageText: Padding(
      padding: EdgeInsets.only(
        left: 3.0.wp,
      ),
      child: Text(
        description,
        style: TextStyles.poppinsMedium.copyWith(
          fontSize: 2.9.wp,
          color: ColorManager.white,
          wordSpacing: 0.6,
          letterSpacing: 0.6,
        ),
      ),
    ),

// borderRadius: 0,
    shouldIconPulse: false,
    icon: Container(
      padding: EdgeInsets.only(left: 4.0.wp),
      child: Icon(
        Icons.info_outline_rounded,
        color: ColorManager.white,
        size: 7.0.wp,
      ),
    ),
    isDismissible: false,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.fastOutSlowIn,
    duration: const Duration(milliseconds: 3000),
    animationDuration: const Duration(milliseconds: 750),
    margin: EdgeInsets.all(6.25.wp),
    snackPosition: SnackPosition.bottom,
    backgroundColor: Colors.blueGrey,
    colorText: ColorManager.white,
  );
}

//Coloring System Bar
void systemBarColor(Color statusColor, Color navColor) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: statusColor, //top bar color
    statusBarIconBrightness: (statusColor == ColorManager.white ||
            statusColor == ColorManager.transparent)
        ? Brightness.dark
        : Brightness.light, //top bar icons
    systemNavigationBarColor: navColor, //bottom bar color
    systemNavigationBarIconBrightness: (navColor == ColorManager.white ||
            statusColor == const Color.fromRGBO(240, 240, 240, 1))
        ? Brightness.dark
        : Brightness.light, //bottom bar icons
  ));
}

//Check Connection
void checkConnectionBeforeExecute(Function() functions) async {
  List<ConnectivityResult> result = await Connectivity().checkConnectivity();

  if (result.contains(ConnectivityResult.none)) {
    Get.dialog(
        NoConnectionDialog(
          colorNavigationBar: ColorManager.bgDark,
        ),
        barrierDismissible: true);
  } else {
    functions();
  }
// print(result);
}

//Focus Textfield
void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

String generateRandomId(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final id = StringBuffer();

  for (var i = 0; i < length; i++) {
    id.write(chars[random.nextInt(chars.length)]);
  }

  return id.toString();
}
