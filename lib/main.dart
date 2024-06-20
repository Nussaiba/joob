import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/bindings/initialbindinds.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/localization/changelocal.dart';
import 'package:jobs/core/localization/translation.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/routes.dart';
import 'package:jobs/view/screen/apply/all_applies_company.dart';
import 'package:jobs/view/screen/apply/choose_apply_way.dart';
import 'package:jobs/view/screen/auth/login.dart';
import 'package:jobs/view/screen/apply/apply_cv.dart';

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
      darkTheme: ThemeData.dark(),
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
      initialRoute: '/splash',
      initialBinding: InitialBindings(),
      //   home: OpportunitiesPagea(),
      //home: SendCVPage(),
      //  //home: CompanyHome(),
      //home:MyAppA(),
      // home:MainScreensCompany(),
      //home: Login(),
      // home:CountryDropdown(),
      //  home:const SignUp(),
      //home:MyHomePage11Con(),
      //home: ASDF(),
      //  home:  FadeAnimationPage(),
      // home:CVPage(),
      // home:UserInputPage(),
      // home:CreateProfilePageCompany(),
      // home :JobOpportunityScreen1(),
      // home : const JobOpportunityScreen(),
      // home: const OpportunityPage(),
      // home:FirstPage(),
      // home:SkillsPage(),
      // home:AddJobOpportunityScreen(),
      // home:  PostWidget(),
      // home : EditProfilePage(),
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
