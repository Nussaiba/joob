import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/successsignup_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:lottie/lottie.dart';

class SuccessSignUp extends StatelessWidget {
  SuccessSignUp({Key? key}) : super(key: key);
  final controller = Get.put(SuccessSignUpConroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.praimaryColor,
          elevation: 0.0,
          title: Text(
            "24".tr,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Center(
              child: Lottie.asset(AppImageAsset.success1, repeat: false),
            ),
            Text(
              "23".tr,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "25".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "ceate profile",
                color: AppColor.praimaryColor,
                onPressed: () {
                  controller.goToProfile();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ]),
        ));
  }
}
