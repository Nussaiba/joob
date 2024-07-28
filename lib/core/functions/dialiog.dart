import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

getDialog(String title, String message) async {
  return await Get.defaultDialog(
    title: title,
    middleText: message,
    middleTextStyle:  TextStyle(color: AppColor.White()),
    titleStyle:  TextStyle(color: AppColor.White()),
    backgroundColor: AppColor.praimaryColor,
  );
}

getSnakBar(String title, String message, int seconds) async {
  return Get.snackbar(title, message,
      colorText: AppColor.white,
      backgroundColor: AppColor.grey.withOpacity(0.6),
      duration: Duration(seconds: seconds));
}
