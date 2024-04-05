import 'package:get/get.dart';

class VerificationController extends GetxController {
  String verificationCode = '';

  void addNumber(String number) {
    if (verificationCode.length < 6) {
      verificationCode += number;
      update(); // يقوم بتحديث الواجهة
    }
  }

  void removeNumber() {
    if (verificationCode.isNotEmpty) {
      verificationCode = verificationCode.substring(0, verificationCode.length - 1);
      update(); // يقوم بتحديث الواجهة
    }
  }
}