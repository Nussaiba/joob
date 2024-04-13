import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/verifycode_register_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';

class VerifyCodeRegister extends StatelessWidget {
  const VerifyCodeRegister({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
        Get.put(VerifyCodeRegisterControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.praimaryColor,
          elevation: 0.0,
          title: Text(
            'Check Code',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body:
        GetBuilder<VerifyCodeRegisterControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget:
                  
         Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(children: [
              const CustomTextTitleAuth(
                text: "Success SignUp",
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextBodyAuth(
                  text:
                      "Please Enter Your Email Address To Recive A Verification Code"),
              const SizedBox(
                height: 15,
              ),
              OtpTextField(
                borderRadius: BorderRadius.circular(20),
                focusedBorderColor: AppColor.praimaryColor,
                cursorColor: AppColor.grey,
                fieldWidth: 42.0,
                numberOfFields: 6,
                borderColor: const Color.fromARGB(255, 129, 45, 168),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                 // Get.toNamed(AppRoute.successSignUp);
                   controller.goToSuccessSignUp(verificationCode);
                }, // end onSubmit
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),

  GetBuilder<VerifyCodeRegisterControllerImp>(
                      builder: (controller) => InkWell(
                        onTap: controller.remainingTime == 0
                            ? controller.resendCode
                            : null,
                        
                          child: Text(
                            textAlign: TextAlign.end,
                            controller.remainingTime > 0
                                ? 'Resend after ${controller.timerText}'
                                : 'Resend Now',
                            style: TextStyle(
                               
                                color: controller.remainingTime > 0
                                    ? AppColor.grey
                                    : AppColor.praimaryColor,
                                fontWeight: FontWeight.bold),
                          
                        ),
                      ),
                    ),
            ])
                ),
      )
    ));
  }
}
