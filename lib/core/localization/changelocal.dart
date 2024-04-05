import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobs/core/services/services.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  //final box = GetStorage();

  changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.box.write("lang", languageCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? boxLanguage = myServices.box.read("lang");
    if (boxLanguage == "ar") {
      language = const Locale("ar");
    } else if (boxLanguage == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
