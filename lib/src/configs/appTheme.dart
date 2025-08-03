import 'package:flutter/material.dart';
import 'package:jatri_app/src/configs/appColors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: white,
      ),
    ),
  );
}
