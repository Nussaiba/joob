import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/seeker/settings/create_profile_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/general/custom_drop_search.dart';
import 'package:jobs/view/widget/general/custom_text_field.dart';
import 'package:jobs/view/widget/general/Custom_choose_image.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/custom_date.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/custom_name.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/text_user.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/text_email.dart';

class CreateProfilePage extends StatelessWidget {
  const CreateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateProfileControllerImp());

    return Scaffold(
      // backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.praimaryColor,
        elevation: 0.0,
        title: Text(
          "Create Profile",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<CreateProfileControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
              onWillPop: alertExitApp,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [

                     const Center(
                    child: Text(
                      'Seeker Info',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  FadeAnimation(  CustomTextUser(
                      text: "${controller.username}",
                    ),0.3),
                  const FadeAnimation(
                      CustomTextBodyAuth(
                          text:
                              "Create your Profile here \n Please fill out the following fields "),
                      0.6),
                  const SizedBox(
                    height: 15,
                  ),
                   
                  
                    // CustomTextEmail(text: "${controller.email}"),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // const Divider(
                    //     height: 16,
                    //     thickness: 1,
                    //     indent: 12,
                    //     endIndent: 12,
                    //     color: AppColor.black),
                         FadeAnimation( CustomChooseImage(
                      onTap: () {
                        controller.getImage();
                      },
                      image: controller.image,
                    ),1.1),
                    const SizedBox(height: 10),
                     FadeAnimation( CustomName(
                      controller1: controller.firstname,
                      controller2: controller.lastname,
                    ),1.4),
                     FadeAnimation( CustomDate(
                        text: controller.birthday1 != null
                            ? controller.birthday1!.toString().split(' ')[0]
                            : 'Enter your Birthday',
                        onTap: () {
                          controller.pickBirthday(context);
                        }),1.7),


               FadeAnimation(
                  CustomDropDownSearch(
                    label: "select country",
                    hint: 'Select your Country',
                    items: controller.countries.map((country) {
                    return  country.county;
                    }).toList(),
                    icon: Icons.location_on,
                    onChanged: controller.setSelectedCountry,
                  ),2),

                 FadeAnimation(CustomDropDownSearch(
                    label: "select city",
                    hint: 'Select your ciy',
                    items: controller.cities.map((city) {
                    return  city.name;
                    }).toList(),
                    icon: Icons.home_work,
                    onChanged: controller.setSelectedCiTy,
                  ),2.5),
                  
                 
                
                       FadeAnimation(  CustomTextFieldInfo(
                      icon: Icons.person,
                      label: "skills",
                      hint: "skills",
                      mycontroller: controller.skills,
                    ),3),
                         FadeAnimation(CustomTextFieldInfo(
                      icon: Icons.card_giftcard,
                      label: "certificates",
                      hint: "certificates",
                      mycontroller: controller.certificates,
                    ),3.5)
,                       FadeAnimation(  CustomTextFieldInfo(
                      icon: Icons.perm_device_information,
                      label: "about",
                      hint: "about",
                      mycontroller: controller.about,
                    ),4),
                      const SizedBox(
                      height: 20,
                    ),
                       FadeAnimation(  CustomButtomAuth(
                        text: "create profile",
                        onPressed: () {
                          controller.createProfile();
                        }),5),
                    const SizedBox(
                      height: 30,
                    ),
                  ]),
                ),
              )),
        ),
      ),
    );
  }
}
