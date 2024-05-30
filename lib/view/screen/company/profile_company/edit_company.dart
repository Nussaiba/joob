import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/seeker/settings/update_profile_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/custom_date.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/custom_name.dart';

class EditProfilePageCompany  extends StatelessWidget {
  const EditProfilePageCompany ({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateProfileControllerImp());

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.praimaryColor,
        elevation: 0.0,
        title: Text(
          "Edit Profile",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<UpdateProfileControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
              onWillPop: alertExitApp,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                   InkWell(
                      onTap: () async {
                        await controller.getImage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 140),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: AppColor.praimaryColor3, width: 2)),
                          child: Image.file(controller.image == null ?
                                  controller.getImageSaved()!  : controller.image!,
                                  fit: BoxFit.fitWidth,
                                ),
                        ),
                      ),
                    ),
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
                      controller1: controller.firstname!,
                      controller2: controller.lastname!,
                    ),
                    CustomDate(
                        text: controller.birthday1 != null
                            ? controller.birthday1!.toString().split(' ')[0]
                            : 'Enter your Birthday',
                        onTap: () {
                          controller.pickBirthday(context);
                        }),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 50, "username");
                      },
                      mycontroller: controller.location,
                      hinttext: controller.location!.text,
                      labeltext: "location",
                      iconData: Icons.my_location,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 50, "username");
                      },
                      mycontroller: controller.skills,
                      hinttext: "${controller.Skills}",
                      labeltext: "skills",
                      iconData: Icons.person,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 50, "username");
                      },
                      mycontroller: controller.certificates,
                      hinttext: controller.Certificates!,
                      labeltext: "certificates",
                      iconData: Icons.card_giftcard,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 50, "username");
                      },
                      mycontroller: controller.about,
                      hinttext: "about",
                      labeltext: "about",
                      iconData: Icons.perm_device_information,
                    ),
                    CustomButtomAuth(
                        text: "Update profile",
                        onPressed: () {
                          controller.updateProfile();
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
