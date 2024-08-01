import 'package:flutter/material.dart';

class Fonts {
  static const poppinsRegular = 'poppins_regular';
  static const poppinsMedium = 'poppins_medium';
  static const poppinsSemiBold = 'poppins_semi_bold';
  static const poppinsBold = 'poppins_bold';
}

class TextStyles {
  static const poppinsRegular = TextStyle(
    fontFamily: Fonts.poppinsRegular,
  );

  static const poppinsMedium = TextStyle(
    fontFamily: Fonts.poppinsMedium,
    wordSpacing: 1,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
  );
  static const poppinsSemiBold = TextStyle(
    fontFamily: Fonts.poppinsSemiBold,
    wordSpacing: 1,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
  );
  static const poppinsBold = TextStyle(
    fontFamily: Fonts.poppinsBold,
    fontWeight: FontWeight.bold,
  );
}
