import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/signup_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';
import 'package:jobs/view/widget/auth/textsignup.dart';

import '../../widget/auth/custombuttomauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.praimaryColor,
        elevation: 0.0,
        title: Text(
          'Sign Up',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget:
            WillPopScope(onWillPop: alertExitApp,child:  
             Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    const CustomTextTitleAuth(
                      text: "Welcome Back",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextBodyAuth(
                        text:
                            "Sign Up With Your Email And Password OR Continue With Google"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 20, "username");
                      },
                      mycontroller: controller.username,
                      hinttext: "Enter Your Username",
                      labeltext: "Username",
                      iconData: Icons.person_outline,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                                            return validInput(val!, 5, 50, "email");

                      },
                      mycontroller: controller.email,
                      hinttext: "Enter Your Email",
                      labeltext: "Email",
                      iconData: Icons.email_outlined,
                    ),
                    CustomTextFormAuth(
                      valid: (value) {
                              return isPasswordCompliant(value!);
                            },
                      mycontroller: controller.password,
                      hinttext: "Enter Your Password",
                      labeltext: "Password",
                      iconData: controller.isShowPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            obscureText: controller.isShowPassword,
                            onTapIcon: () {
                              controller.showPassWord();
                            },
                    ),
                    CustomButtomAuth(
                        text: "Sign Up",
                        onPressed: () {
                          controller.SignUp();
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextSignUpOrSignIn(
                      textone: "have an accunt ?  ",
                      texttwo: "  Sign In",
                      onTap: () {
                        controller.goToSignIn();
                      },
                    )
                  ]),
                )),),
            
            
           ),
      ),
    );
  }
}
