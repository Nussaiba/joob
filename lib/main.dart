import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobs/bindings/initialbindinds.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/localization/changelocal.dart';
import 'package:jobs/core/localization/translation.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/routes.dart';
import 'package:jobs/view/a.dart';
import 'package:jobs/view/report_page.dart';
import 'package:jobs/view/rrrrrrrrr.dart';
import 'package:jobs/view/screen/company/main_screens/home_company.dart';
import 'package:jobs/view/screen/homescreen.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import 'package:jobs/view/screen/all_opportunity_test.dart';
import 'package:jobs/view/screen/bubbless.dart';
import 'package:jobs/view/screen/company/main_screens/main_screen_company.dart';
import 'package:jobs/view/screen/company/opportunity/add_opportunity.dart';
import 'package:jobs/view/screen/company/opportunity/edit_opportunity.dart';
import 'package:jobs/view/screen/company/profile_company/create_company.dart';
import 'package:jobs/view/screen/hero.dart';
import 'package:jobs/view/screen/opportunity.dart';
import 'package:jobs/view/screen/pdf.dart';
import 'package:jobs/view/screen/seeker/cv/cv_test.dart';
import 'package:jobs/view/screen/chat/search_chat.dart';
import 'package:jobs/view/screen/seeker/cv/create_cv.dart';
import 'package:jobs/view/screen/lod.dart';
import 'package:jobs/view/screen/create_post.dart';
import 'package:jobs/view/screen/seeker/main_screens/main_screen.dart';
import 'package:jobs/view/screen/on_boarding/onboarding.dart';
import 'package:jobs/view/screen/seeker/profile/create_profile.dart';
import 'package:jobs/view/screen/seeker/profile/edit_profile.dart';
import 'package:jobs/view/screen/auth/signup.dart';
import 'package:jobs/view/screen/floating.dart';
import 'package:jobs/view/screen/auth/account_type.dart';
import 'package:jobs/view/screen/splash.dart';
import 'package:jobs/view/screen/tes.dart';
import 'package:jobs/view/screen/auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      title: 'Flutter Demo',
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(
              ),
      theme: ThemeData(
        
        //fontFamily: "Pacifico",
        // fontFamily : "Cairo" ,
        fontFamily: "Gafata",
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
          headline2: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
          headline3: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: AppColor.white,
          ),
          bodyText1: TextStyle(
              height: 2,
              color: AppColor.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14),
          bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
        ),
   ),
 //  initialRoute: '/splash',
      initialBinding: InitialBindings(),
      home:HomeScreen55(),
      //  home:MyAppA(),
      //home:MyHomePage11Con(),
      //home: ASDF(),
  //  home:  FadeAnimationPage(),
      // home:CVPage(),
      // home:UserInputPage(),
    //home:  CreateProfilePageCompany(),
      //  home :JobOpportunityScreen1(),
      //  home : const JobOpportunityScreen(),
      // home: const OpportunityPage(),
      //  home:FirstPage(),
      //  home:SkillsPage(),
      // home:AddJobOpportunityScreen(),
      //  home:  PostWidget(),
      //  home : EditProfilePage(),
      // home: const CreateProfilePage(),
      // home: SignUp(),
      // home: SearchChat(),
      // home:CV(),
      // home: AccountTypePage(),
      // home : PostPage(),
      getPages: routes,
    );
  }
}
