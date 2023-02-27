import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/configs/themes/app_colors.dart';
import 'package:flutter_quiz_app/configs/themes/ui_parameters.dart';
import 'package:get/get.dart';

const questionTS = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(fontSize: 22, fontWeight: FontWeight.w700,
    color: onSurfaceTextColor);
const appBarTS = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: onSurfaceTextColor);

TextStyle cardTitles(context) => TextStyle(
  color: UIParameters.isDarkMode()?Theme.of(context).textTheme.bodyText1!.color
      : Theme.of(context).primaryColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle countdownTimerTS () => TextStyle(
  letterSpacing: 2,
  color: UIParameters.isDarkMode()?Theme.of(Get.context!).textTheme.bodyText1!.color
      : Theme.of(Get.context!).primaryColor
);


