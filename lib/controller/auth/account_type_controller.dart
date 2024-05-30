import 'package:get/get.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/services/services.dart';

class AccountTypeController extends GetxController {
  var accountType = ''.obs;
  bool isActiveseeker = false;
  bool isActiveCompany = false;
  MyServices myServices = Get.find();

  void setAccountSeeker(String type) {
    isActiveseeker = true;
    isActiveCompany = false;
    accountType.value = type;
  }

  void setAccountCompany(String type) {
    isActiveseeker = false;
    isActiveCompany = true;
    accountType.value = type;
  }

  goToSignUp() {
    myServices.box.write("step", "2");
    myServices.box.write("account", accountType.value);
    Get.offNamed(AppRoute.signUp);
  }
}
