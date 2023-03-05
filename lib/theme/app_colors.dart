import 'package:flutter/material.dart';

abstract class AppColors {
  Color get white;
  Color get black;
  Color get grey;
  Color get pink;
  Color get lightPink;
  Color get brown;
  Color get darkBrown;
  Color get caramel;
  Color get beige;
  Color get darkBeige;
}

class AppColorsDefault implements AppColors {
  @override
  get white => const Color(0xFFF0EEED);

  @override
  get black => const Color(0xFF332C39);

  @override
  get grey => const Color(0xFF434242);

  @override
  get pink => const Color(0xFFC92C6D);

  @override
  get lightPink => const Color(0xFFFF8FB1);

  @override
  get brown => const Color(0xFF401E0A);

  @override
  get darkBrown => const Color(0xFF260705);

  @override
  get caramel => const Color(0xFF8C5627);

  @override
  get beige => const Color(0xFFF2CA99);

  @override
  get darkBeige => const Color(0xFFD9A05B);
}
