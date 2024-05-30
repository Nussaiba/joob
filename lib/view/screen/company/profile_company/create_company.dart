import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company/profile_company/profile_company.dart';
import 'package:jobs/controller/seeker/settings/create_profile_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/view/fade_animation.dart';
import 'package:jobs/view/widget/general/custom_text_field.dart';
import 'package:jobs/view/widget/general/Custom_choose_image.dart';

class CreateProfilePageCompany extends StatelessWidget {
   CreateProfilePageCompany({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateProfileCompanyControllerImp());

    return Scaffold(
      //backgroundColor: Colors.black,
        // appBar: AppBar(
        //   title: const Text('بروفايل الشركة'),
        //   backgroundColor: Colors.deepPurple,
        //   elevation: 0,
        // ),
        body: GetBuilder<CreateProfileCompanyControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: alertExitApp,
                child: Container(
                  // decoration: const BoxDecoration(
                  //   image :
                  //   DecorationImage(image:   
                    
                  //    AssetImage(AppImageAsset.onBoardingImgSeven),
                  //   fit:BoxFit.cover
                  //   )
                   
                  // ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListView(
                    children: [
                      const Center(
                        child: Text(
                          'company Info',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      FadeAnimation(
                          CustomChooseImage(
                            onTap: () {
                              controller.getImage();
                            },
                            image: controller.image,
                          ),
                          0.5),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.business,
                            label: 'اسم الشركة',
                            hint: 'أدخل اسم الشركة هنا',
                            mycontroller: controller.companyname,
                          ),
                          1),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.location_on,
                            label: 'الموقع',
                            hint: 'أدخل موقع الشركة هنا',
                            mycontroller: controller.location,
                          ),
                          1.5),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.info_outline,
                            label: 'حول الشركة',
                            hint: 'أدخل معلومات حول الشركة',
                            maxLines: 3,
                            mycontroller: controller.about,
                          ),
                          2),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.contact_phone,
                            label: 'معلومات الاتصال',
                            hint: 'أدخل معلومات الاتصال هنا',
                            mycontroller: controller.contactInfo,
                          ),
                        2.5),
                      const SizedBox(height: 40),
                      FadeAnimation(
                          ElevatedButton(
                            onPressed: () {
                              controller.createProfile();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              "create profile",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          3.5),
                    ],
                  ),
                ),
              )),
        ));
  }
}
