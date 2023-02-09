import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundColor;
  Color get pink;
  Color get lightPink;
  Color get green;
  Color get black;
  Color get purple;
}

class AppColorsDefault implements AppColors {
  @override
  get backgroundColor => const Color(0xFFF0EEED);

  @override
  get pink => const Color(0xFFC92C6D);

  @override
  get lightPink => const Color(0xFFFF8FB1);

  @override
  get green => const Color(0xFF609EA2);

  @override
  get black => const Color(0xFF332C39);

  @override
  get purple => const Color(0xFFB270A2);
}
