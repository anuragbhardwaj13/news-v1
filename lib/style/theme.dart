import 'package:flutter/material.dart';
import 'package:inshort_clone/style/colors.dart';

final ThemeData kDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff222222),
  primaryColor: AppColor.accent,
  appBarTheme: AppBarTheme(
    color: Color(0xff333333),
    iconTheme: IconThemeData(
      color: AppColor.accent,
    ),
  ),
  iconTheme: IconThemeData(
    color: AppColor.accent,
  ),
  fontFamily: "Montserrat",
);

final ThemeData kLightThemeData = ThemeData(
  canvasColor: AppColor.background,
  colorScheme: ColorScheme.light(
    primary: AppColor.accent,
    onPrimary: Colors.white,
    error: AppColor.error,
  ),
  scaffoldBackgroundColor: Colors.white,
  iconTheme: IconThemeData(
    color: AppColor.accent,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(
      color: AppColor.accent,
    ),
  ),
  fontFamily: "Montserrat",
);
