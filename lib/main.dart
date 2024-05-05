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
import 'package:jobs/view/screen/lod.dart';
import 'package:jobs/view/screen/main2/main_screen.dart';
import 'package:jobs/view/screen/mainscreen/mainscreens.dart';
import 'package:jobs/view/screen/onboarding.dart';
import 'package:jobs/view/screen/profile/create_profile.dart';
import 'package:jobs/view/screen/profile/edit_profile.dart';
import 'package:jobs/view/screen/auth/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  //  await Get.putAsync(() => GetStorage.init());
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
      theme: ThemeData(
        //fontFamily: "Pacifico",
        // fontFamily : "Cairo" ,
        fontFamily: "Gafata",
        textTheme:const TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
          headline2: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
              headline3: TextStyle( fontWeight: FontWeight.bold,  fontSize: 30, color: AppColor.white,),
          bodyText1: TextStyle(    
              height: 2,
              color: AppColor.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14),
          bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
        ),
      ),
      initialBinding: InitialBindings(),
      //  home : EditProfilePage(),
      //home: const CreateProfilePage(),
      // home :Test(),
      // home: MainScreen(),
      home :const MainScreen2(),
      getPages: routes,
    );
  }
}
