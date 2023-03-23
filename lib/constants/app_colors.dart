import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

class AppColors {
  static MaterialColor primary =
      generateMaterialColor(color: const Color.fromRGBO(0, 138, 70, 1));
  static MaterialColor secondary =
      generateMaterialColor(color: const Color.fromRGBO(137, 199, 74, 1));
  static MaterialColor titles =
      generateMaterialColor(color: const Color.fromRGBO(31, 172, 199, 1));
  static const Color text = Colors.black;
}
