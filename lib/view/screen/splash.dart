import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/screen/auth/login.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(()=>Login(),
          transition : Transition.fade,
         //  transition:Transition.rightToLeft,
         //  transition: Transition.zoom,
         // transition: Transition.topLevel,
          
          duration: const Duration(seconds: 2));
    });

    return Scaffold(
      body: Center(
        child: Image.asset(AppImageAsset.onBoardingImgOne),
      ),
    );
  }
}
