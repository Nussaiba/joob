import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:lottie/lottie.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  AppColor.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.praimaryColor,
          elevation: 0.0,
          title: Text(
            'Success',
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
              "Congratulations",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "SignUp successfully",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "Go To Login",
                
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
