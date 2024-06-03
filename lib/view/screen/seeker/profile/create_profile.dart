import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/seeker/settings/create_profile_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/general/custom_text_field.dart';
import 'package:jobs/view/widget/general/Custom_choose_image.dart';
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
                    CustomChooseImage(
                      onTap: () {
                        controller.getImage();
                      },
                      image: controller.image,
                    ),
                    CustomTextUser(
                      text: "${controller.username}",
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomTextEmail(text: "${controller.email}"),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                        height: 16,
                        thickness: 1,
                        indent: 12,
                        endIndent: 12,
                        color: AppColor.black),
                    const SizedBox(height: 10),
                    CustomName(
                      controller1: controller.firstname,
                      controller2: controller.lastname,
                    ),
                    CustomDate(
                        text: controller.birthday1 != null
                            ? controller.birthday1!.toString().split(' ')[0]
                            : 'Enter your Birthday',
                        onTap: () {
                          controller.pickBirthday(context);
                        }),
                    CustomTextFieldInfo(
                      icon: Icons.my_location,
                      label: "location",
                      hint: "location",
                      mycontroller: controller.location,
                    ),
                    CustomTextFieldInfo(
                      icon: Icons.person,
                      label: "skills",
                      hint: "skills",
                      mycontroller: controller.skills,
                    ),
                    CustomTextFieldInfo(
                      icon: Icons.card_giftcard,
                      label: "certificates",
                      hint: "certificates",
                      mycontroller: controller.certificates,
                    ),
                    CustomTextFieldInfo(
                      icon: Icons.perm_device_information,
                      label: "about",
                      hint: "about",
                      mycontroller: controller.about,
                    ),
                    CustomButtomAuth(
                        text: "create profile",
                        onPressed: () {
                          controller.createProfile();
                        }),
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
