import 'package:get/get.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/middleware/mymiddleware.dart';
import 'package:jobs/view/screen/lod.dart';
import 'package:jobs/view/screen/mainscreen/mainscreens.dart';
import 'package:jobs/view/screen/testscreen.dart';
import 'view/screen/auth/verifycode_register.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/success_signup.dart';
import 'view/screen/onboarding.dart';
import 'view/screen/auth/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'view/screen/auth/forgetpassword/verfiycode.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => OnBoarding(), middlewares: [MyMiddleWare()]),

  GetPage(name: AppRoute.testscreen, page: () => Test()),

  GetPage(name: AppRoute.log, page: () => Log()),
  //OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => OnBoarding()),
  //Auth
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.signUp, page: () => SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoute.verfiyCodeForgetpassword, page: () => VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword, page: () => SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => SuccessSignUp()),
  GetPage(name: AppRoute.verifyCodeRegister, page: () => VerifyCodeRegister()),

  GetPage(name: AppRoute.mainScreen, page: () => MainScreen()),
];
