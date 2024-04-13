import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

class ProfileController extends GetxController {
  DateTime? birthday;

  void pickBirthday(BuildContext context) async {
    DateTime initialDate = birthday ?? DateTime.now();
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:AppColor.praimaryColor,
            colorScheme: ColorScheme.light(primary: AppColor.praimaryColor,),
           
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != birthday) {
      birthday = pickedDate;
      update(); // تحديث الواجهة
    }
  }
}
