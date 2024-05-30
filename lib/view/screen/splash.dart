import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/splash_controller.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: splashController.animation,
          child: 
          Lottie.asset(AppImageAsset.loadingliner),
          //Image.asset(AppImageAsset.onBoardingImgFive),
        ),
      ),
    );
  }
}
