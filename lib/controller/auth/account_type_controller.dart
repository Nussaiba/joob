import 'package:get/get.dart';

class AccountTypeController extends GetxController {
  var accountType = ''.obs;
  bool isActiveseeker = false;
  bool isActiveCompany = false;

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
}