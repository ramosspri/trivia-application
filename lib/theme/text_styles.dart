import 'package:flutter/material.dart';

abstract class AppTextStyles {
  TextStyle get latoBlack;
  TextStyle get latoBold;
  TextStyle get latoLight;
  TextStyle get latoRegular;
  TextStyle get latoThin;
  TextStyle get tiltRegular;
}

class AppTextStylesDefault extends AppTextStyles {
  @override
  TextStyle get latoBlack => const TextStyle(
        fontFamily: 'Lato-Black',
      );

  @override
  TextStyle get latoBold => const TextStyle(
        fontFamily: 'Lato-Bold',
      );

  @override
  TextStyle get latoLight => const TextStyle(
        fontFamily: 'Lato-Light',
      );

  @override
  get latoRegular => const TextStyle(
        fontFamily: 'Lato-Regular',
      );

  @override
  TextStyle get latoThin => const TextStyle(
        fontFamily: 'Lato-Thin',
      );

  @override
  get tiltRegular => const TextStyle(
        fontFamily: 'Tilt-Regular',
      );
}
