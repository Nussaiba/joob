import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.praimaryColor,
          elevation: 0.0,
          title: Text(
            "16".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(children: [
                         CustomTextTitleAuth(
                          text: "32".tr,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         CustomTextBodyAuth(
                            text:
                                "29".tr),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 8, 50, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "12".tr,
                          labeltext: "13".tr,
                          iconData: Icons.email_outlined,
                        ),
                        CustomButtomAuth(
                            text: "33".tr,
                            onPressed: () {
                              controller.checkemail();
                              //   Get.offNamed(
                              //     AppRoute.verfiyCodeForgetpassword,
                              //       arguments: {"email": controller.email.text});
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                      ]),
                    ),
                  ),
                )));
  }
}
