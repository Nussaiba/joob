import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobs/bindings/initialbindinds.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/localization/changelocal.dart';
import 'package:jobs/core/localization/translation.dart';
import 'package:jobs/core/services/services.dart';

import 'package:jobs/routes.dart';
import 'package:jobs/view/screen/lod.dart';
import 'package:jobs/view/screen/onboarding.dart';

void main()async  {
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
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
          headline2: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
          bodyText1: TextStyle(
              height: 2,
              color: AppColor.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14),
          bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
        ),
      ),
      initialBinding: InitialBindings(),
      home : Log(),
      getPages: routes,
    );
  }
}