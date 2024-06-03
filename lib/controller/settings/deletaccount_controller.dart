import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';

import '../../core/constants/routes.dart';
import '../../core/functions/dialiog.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/settings/deletaccount.dart';


abstract class DeleteAccountController extends GetxController {
  deleteAccount();
}

class DeleteAccountControllerImp extends DeleteAccountController {
  StatusRequest statusRequest = StatusRequest.none;
  DeleteAccountData deleteAccountData = DeleteAccountData(Get.find());
  MyServices myServices = Get.find();

  @override
  deleteAccount() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteAccountData.deleteAccount();
    statusRequest = handlingData(response);
    print("Delete account status: $statusRequest");

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        
        Get.offAllNamed(AppRoute.login);
       // Get.off(Login());
        getSnakBar("Success", "Account deleted successfully", 3);
      } else {
        
        getDialog("Error", "Failed to delete account: ${response["message"]}");
      }
    }
    update();
  }

  
}
