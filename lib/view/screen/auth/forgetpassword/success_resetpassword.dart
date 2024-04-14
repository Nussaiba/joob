import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:lottie/lottie.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 0.0,
          title: Text(
            "24".tr,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: AppColor.grey,
                ),
          ),
        ),
        body: 
        
        Container(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Center(
           
              child: Lottie.asset(AppImageAsset.success1, repeat: false),
            ),
            Text(
              "23".tr,
              style: Theme.of(context).textTheme.headline2,
            ),
             const   SizedBox(
              height: 15,
            ),
            Text(
              "42".tr ,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey),
            ),
            const Spacer(),
             SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "26".tr ,
                onPressed: () {
                  Get.offAllNamed(AppRoute.login);
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
