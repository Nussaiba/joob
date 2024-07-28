import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/services/services.dart';

class AppColor {
  MyServices myServices = Get.find();

  static Color praimaryColor = Color(0xff5B0888);
  static Color PraimaryColor() {
    MyServices().box.read("theme") == true
        ? praimaryColor = Color(0xff939da6)
        : praimaryColor = Color(0xff5B0888);
    return praimaryColor;
  }

  static Color praimaryColor2 = Color(0xff5B0888);
  static Color PraimaryColor2() {
    MyServices().box.read("theme") == true
        ? praimaryColor2 = Color.fromARGB(255, 156, 156, 156)
        : praimaryColor2 = Color(0xff713ABE);
    return praimaryColor2;
  }

  static Color praimaryColor3 = Color(0xff9D76C1);
  static Color PraimaryColor3() {
    MyServices().box.read("theme") == true
        ? praimaryColor3 = Color.fromARGB(255, 201, 200, 200)
        : praimaryColor3 = Color(0xff9D76C1);
    return praimaryColor3;
  }

  static Color backgroundcolor = Color(0xff1f1f1f);
  static Color Backgroundcolor() {
    MyServices().box.read("theme") == true
        ? backgroundcolor = Color(0xff1f1f1f)
        : backgroundcolor = Colors.grey[300]!;
    return backgroundcolor;
  }

  static Color textColor = Colors.black;
  static Color TextColor() {
    MyServices().box.read("theme") == true
        ? textColor = Colors.white
        : textColor = Colors.black;
    return textColor;
  }

  static Color iconColor = Color(0xff5B0888);
  static Color IconColor() {
    MyServices().box.read("theme") == true
        ? iconColor = Colors.white70
        : iconColor = Color(0xff5B0888);
    return iconColor;
  }

  static Color grey = Color.fromARGB(255, 114, 113, 113);
  static Color Grey() {
    MyServices().box.read("theme") == true
        ? grey = Colors.white70
        : grey = Color.fromARGB(255, 114, 113, 113);
    return grey;
  }

  static Color grey2 = Color.fromARGB(106, 116, 115, 115);
  static Color Grey2() {
    MyServices().box.read("theme") == true
        ? grey2 = Color.fromARGB(226, 114, 113, 113)
        : grey2 = Color.fromARGB(106, 116, 115, 115);
    return grey2;
  }

  static Color black = Color(0xff000000);
  static Color Black() {
    MyServices().box.read("theme") == true
        ? black = Color.fromARGB(255, 255, 255, 255)
        : black = Color(0xff000000);
    return black;
  }

  static Color white = Color.fromARGB(232, 255, 255, 255);
  static Color White() {
    MyServices().box.read("theme") == true
        ? white = Color.fromARGB(255, 41, 41, 44)
        : white = Color.fromARGB(232, 254, 249, 255);
    return white;
  }

  static  Color pink = praimaryColor.withOpacity(0.2);
   static Color Pink() {
    MyServices().box.read("theme") == true
        ? pink = Color(0xff939da6).withOpacity(0.2)
        : pink = praimaryColor.withOpacity(0.2);
    return pink;
  }
}
