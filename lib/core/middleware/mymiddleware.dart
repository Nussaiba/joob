import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();


  @override
  RouteSettings? redirect(String? route) {
      if (myServices.box.read("step") == "2") {
      return const  RouteSettings(name: AppRoute.mainScreens);
    }
    if (myServices.box.read("step") == "1") {
      return const  RouteSettings(name: AppRoute.login);
    }
   
    return null;
  }
}
