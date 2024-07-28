import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

ThemeData darktheme = ThemeData(
  fontFamily: "Gafata",
  scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.praimaryColor,
    secondary: AppColor.praimaryColor,
    onSecondary: AppColor.praimaryColor,
  ),
  iconTheme: IconThemeData(color: AppColor.iconColor),

  textTheme: Get.locale == const Locale('en') ? TextTheme() : TextTheme(),

  // GoogleFonts.promptTextTheme(ThemeData(
  //     brightness: Brightness.light,
  //   ).textTheme)
  // :
  // GoogleFonts.tajawalTextTheme(
  //     ThemeData(brightness: Brightness.light).textTheme),
  appBarTheme:
      AppBarTheme(backgroundColor: ThemeData.dark().scaffoldBackgroundColor),
);

ThemeData lighttheme = ThemeData(
    fontFamily: "Gafata",
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.praimaryColor,
      secondary: AppColor.praimaryColor,
      onSecondary: AppColor.praimaryColor,
    ),
    iconTheme: IconThemeData(color: AppColor.iconColor),
    textTheme: Get.locale == const Locale('en') ? TextTheme() : TextTheme(),
    appBarTheme: AppBarTheme(
        backgroundColor: ThemeData.light().scaffoldBackgroundColor));
