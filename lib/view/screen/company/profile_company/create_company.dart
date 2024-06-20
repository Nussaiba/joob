import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company/profile_company/create_profile_company.dart';
import 'package:jobs/controller/seeker/settings/create_profile_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/general/custom_drop_search.dart';
import 'package:jobs/view/widget/general/custom_dropdown_button.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
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
                      CustomTextBodyAuth(
                          text:
                              "Create your Company Profile here \n Please fill out the following fields "),
                      0.3),
                  const SizedBox(
                    height: 20,
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
                        label: 'Company name',
                        hint: 'enter company name',
                        mycontroller: controller.companyname,
                      ),
                      1),
                  
                 
FadeAnimation(
                  CustomDropDownSearch(
                    label: "select country",
                    hint: 'Select your Country',
                    items: controller.countries.map((country) {
                    return  country.county;
                    }).toList(),
                    icon: Icons.location_on,
                    onChanged: controller.setSelectedCountry,
                  ),1.5),

                 FadeAnimation(CustomDropDownSearch(
                    label: "select city",
                    hint: 'Select your ciy',
                    items: controller.cities.map((city) {
                    return  city.name;
                    }).toList(),
                    icon: Icons.home_work,
                    onChanged: controller.setSelectedCiTy,
                  ),2),
                  // FadeAnimation(
                  //     CustomDropDownButton(
                  //       label: 'City',
                  //       hint: 'Select your City',
                  //       items2: controller.cities.map((city) {
                  //         return DropdownMenuItem(
                  //           value: city.name,
                  //           child: Text(city.name),
                  //         );
                  //       }).toList(),
                  //       selectedItem: controller.selectedCity,
                  //       icon: Icons.home_work,
                  //       onChanged: controller.setSelectedCiTy,
                  //     ),
                  //     2),
                  FadeAnimation(
                      CustomTextFieldInfo(
                        icon: Icons.info_outline,
                        label: 'Company Info ',
                        hint: 'write about your company',
                        maxLines: 3,
                        mycontroller: controller.about,
                      ),
                      2.5),
                  FadeAnimation(
                      CustomTextFieldInfo(
                        icon: Icons.contact_phone,
                        label: ' Contact ',
                        hint: 'Enter your contact information',
                        mycontroller: controller.contactInfo,
                      ),
                      3),
                  const SizedBox(height: 30),
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
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      4),
                ],
              ),
            ),
          )),
    ));
  }
}
