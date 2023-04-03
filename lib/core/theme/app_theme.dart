import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    centerTitle: true,
  ),
  primarySwatch: AppColors.primary,
  secondaryHeaderColor: AppColors.secondary,
);
