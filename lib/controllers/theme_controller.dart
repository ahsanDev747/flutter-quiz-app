import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/configs/themes/app_dark_theme.dart';
import 'package:get/get.dart';

import '../configs/themes/app_light_theme.dart';

class ThemeController extends GetxController{
  late ThemeData _lightTheme;
  late ThemeData _darkTheme;

  @override
  void onInit() {
    initializeThemeData();
    super.onInit();

  }

  void initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}