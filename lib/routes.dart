import 'package:get/get.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/middleware/mymiddleware.dart';
import 'package:jobs/view/screen/lod.dart';
import 'package:jobs/view/screen/profile/create_profile.dart';
import 'package:jobs/view/screen/profile/edit_profile.dart';
import 'package:jobs/view/screen/profile/profile.dart';
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
  GetPage(
    name: "/", page: () => const OnBoarding(), //middlewares: [MyMiddleWare()]
  ),

  GetPage(name: AppRoute.log, page: () => Log()),
  //OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.verfiyCodeForgetpassword, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verifyCodeRegister,
      page: () => const VerifyCodeRegister()),

  GetPage(name: AppRoute.createProfile, page: () =>const CreateProfilePage()),
  GetPage(name: AppRoute.editProfile, page: () =>const EditProfilePage()),
    GetPage(name: AppRoute.profilePage, page: () =>const ProfilePage()),

];
