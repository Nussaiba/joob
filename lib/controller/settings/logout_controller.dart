import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/dialiog.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/settings/logoutdata.dart';

abstract class LogoutController extends GetxController {
  logout();
}

class LogoutControllerImp extends LogoutController {
  StatusRequest statusRequest = StatusRequest.none;
  LogoutData logoutData = LogoutData(Get.find());

  @override
  logout() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await logoutData.logout();
    statusRequest = handlingData(response);
    print("Logout status: $statusRequest");

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
         Get.offAllNamed(AppRoute.login);
        getSnakBar("Success", "Logged out successfully", 3);
      } else {
        getDialog("Error", "Failed to logout: ${response["message"]}");
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
