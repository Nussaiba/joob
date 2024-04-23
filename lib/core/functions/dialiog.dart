import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

getDialog(String title, String message) async {
  return await Get.defaultDialog(
    title: title,
    middleText: message,
    middleTextStyle: const TextStyle(color: AppColor.white),
    titleStyle: const TextStyle(color: AppColor.white),
    backgroundColor: AppColor.praimaryColor,
  );
}

getSnakBar(String title, String message, int seconds) async {
  return Get.snackbar(title, message,
      colorText: AppColor.white,
      backgroundColor: AppColor.praimaryColor,
      duration: Duration(seconds: seconds));
}
