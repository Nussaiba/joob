import 'package:get/get.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/middleware/mymiddleware.dart';
import 'package:jobs/view/screen/auth/account_type.dart';
import 'package:jobs/view/screen/company/main_screens/home_company.dart';
import 'package:jobs/view/screen/company/main_screens/main_screen_company.dart';
import 'package:jobs/view/screen/company/opportunity/add_opportunity.dart';
import 'package:jobs/view/screen/company/profile_company/create_company.dart';
import 'package:jobs/view/screen/company/profile_company/edit_company.dart';
import 'package:jobs/view/screen/company/profile_company/profile_company.dart';
import 'package:jobs/view/screen/opportunity.dart';
import 'package:jobs/view/screen/create_post.dart';
import 'package:jobs/view/screen/seeker/profile/create_profile.dart';
import 'package:jobs/view/screen/seeker/profile/edit_profile.dart';
import 'package:jobs/view/screen/seeker/profile/profile.dart';
import 'package:jobs/view/screen/seeker/main_screens/main_screen.dart';
import 'package:jobs/view/screen/splash.dart';
import 'view/screen/auth/verifycode_register.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/success_signup.dart';
import 'view/screen/on_boarding/onboarding.dart';
import 'view/screen/auth/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'view/screen/auth/forgetpassword/verfiycode.dart';

List<GetPage<dynamic>>? routes = [
  //splash

  GetPage(
      name: "/splash", page: () =>const SplashPage(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.accountType, page: () => AccountTypePage()),

 // GetPage(name: AppRoute.log, page: () => Log()),

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
//seeker_profile
  GetPage(name: AppRoute.createProfile, page: () => const CreateProfilePage()),
  GetPage(name: AppRoute.editProfile, page: () => const EditProfilePage()),
  GetPage(name: AppRoute.profilePage, page: () => const ProfilePage()),
  //seeker_mainscreens
  GetPage(name: AppRoute.mainScreens, page: () => const MainScreens()),
  GetPage(name: AppRoute.postpage, page: () => PostPage()),

  //company_profile
  GetPage(name: AppRoute.createcompanyProfile, page: () =>   CreateProfilePageCompany()),
  GetPage(name: AppRoute.editcompanyProfile, page: () => const EditProfilePageCompany()),
  GetPage(name: AppRoute.companyprofilePage, page: () => const ProfilePageCompany()),
    GetPage(name: AppRoute.addOpportunity, page: () => const AddJobOpportunityScreen()),


  //company_mainscreens
  GetPage(name: AppRoute.mainScreensCompany, page: () => const MainScreensCompany()),
  GetPage(name: AppRoute.homeCompany, page: () =>  const CompanyHome()),



 //company&seeker
   GetPage(name: AppRoute.opportunityPage, page: () => const OpportunityPage()),

 
];
