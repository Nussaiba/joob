import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/forgetpassword/verifycode_forgetpassword_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.praimaryColor,
          elevation: 0.0,
          title: Text(
            'Verification Code',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body:GetBuilder<  VerifyCodeControllerImp >(builder: (controller)=>
        HandlingDataRequest(statusRequest: controller.statusRequest, widget:Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(children: [
              const CustomTextTitleAuth(
                text: "Check Code",
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextBodyAuth(
                  text:
                      "Please Enter The Digit Code Sent To Nagham@gmail.com "),
              const SizedBox(
                height: 30,
              ),
              OtpTextField(
                borderRadius: BorderRadius.circular(20),
                cursorColor: AppColor.grey,
                focusedBorderColor: AppColor.praimaryColor,
                fieldWidth: 42.0,
                numberOfFields: 6,
                borderColor: AppColor.praimaryColor,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,

                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  print("11111  $verificationCode");
                  Get.offNamed(AppRoute.resetPassword,
                      arguments: {"verfiyCodePassWordreset": verificationCode});

                 //  controller.goToResetPassword(verificationCode);
                }, // end onSubmit
              ),
              const SizedBox(
                height: 30,
              ),
           
         
          
  GetBuilder< VerifyCodeControllerImp >(
              builder: (controller) => MaterialButton(
color:   controller.remainingTime > 0 ?  AppColor.grey : AppColor.praimaryColor,
                onPressed: controller.remainingTime == 0 ? controller.resendCode : null,
                
                child: Text(
                  controller.remainingTime > 0 ? 'Resend after ${controller.timerText}' : 'Resend Now',
                ),
              ),
            ),
            ]))
    
            )),
        
        
    )
         ;
  }
}
