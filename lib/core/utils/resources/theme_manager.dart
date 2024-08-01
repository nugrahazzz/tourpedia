import 'package:flutter/material.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';

abstract class MainThemeApp {
  late ThemeData themeData;
}

class LightModeTheme implements MainThemeApp {
  @override
  ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primaryColor),
    //disable purple
    primarySwatch: Colors.teal,
    canvasColor: Colors.transparent,
    //warna oveflow listview transparant
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.bgDark,
      selectionColor: ColorManager.bgDark,
      selectionHandleColor: ColorManager.bgDark,
    ),
  );

// ThemeData themeData = ThemeData(
//   primaryColor: ColorManager.colorPrimaryLight,
//   cardColor: ColorManager.colorCardLight,
//   scaffoldBackgroundColor: ColorManager.colorBackgroundLight,
//   disabledColor: ColorManager.colorGrey1,
//   splashColor: ColorManager.colorSplash,
//
//   // Text color
//   primaryColorLight: ColorManager.colorFontPrimaryLight,
//   primaryColorDark: ColorManager.colorFontSecondaryLight,
//
//   hintColor: ColorManager.colorPlaceHolderLight,
//
//   shadowColor: ColorManager.colorBackgroundDark,
//
//   fontFamily: FontConstants.fontDMSans,
//
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: ColorManager.colorBackgroundLight,
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: ColorManager.colorPrimaryLight,
//     unselectedItemColor: ColorManager.colorBlack,
//   ),
//
//   appBarTheme: AppBarTheme(
//       centerTitle: true,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       iconTheme: IconThemeData(color: ColorManager.colorFontPrimaryLight, size: AppSize.s20),
//       titleTextStyle: TextStyle(fontSize: 18, color: ColorManager.colorFontPrimaryLight)),
//
//   // input decoration theme (text form field)
//   inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: ColorManager.colorTextFieldLight,
//       contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p20),
//       // hint style
//       hintStyle: TextStyle(color: ColorManager.colorPlaceHolderLight),
//       labelStyle: TextStyle(color: ColorManager.colorFontPrimaryLight),
//       errorStyle: TextStyle(color: ColorManager.colorError),
//
//       // enabled border style
//       enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.transparent, width: AppSize.s1_5), borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),
//
//       // focused border style
//       focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: ColorManager.colorPrimaryLight, width: AppSize.s1_5),
//           borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10))),
//
//       // error border style
//       errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: ColorManager.colorError, width: AppSize.s1_5),
//           borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10))),
//       // focused border style
//       focusedErrorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: ColorManager.colorPrimaryLight, width: AppSize.s1_5),
//           borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)))),
// );
}

class DarkModeTheme implements MainThemeApp {
  @override
  ThemeData themeData = ThemeData();
}
