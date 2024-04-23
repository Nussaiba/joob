import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/settings/create_profile_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/custom_date.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/custom_name.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/text_user.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/textemail.dart';

class CreateProfilePage extends StatelessWidget {
  const CreateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateProfileControllerImp());

    return Scaffold(
      backgroundColor: AppColor.white,
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
                          child: controller.image == null
                              ? const Text("Image not selected")
                              : Image.file(
                                  controller.image!,
                                  fit: BoxFit.fitWidth,
                                ),
                        ),
                      ),
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
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 50, "username");
                      },
                      mycontroller: controller.location,
                      hinttext: "location",
                      labeltext: "location",
                      iconData: Icons.my_location,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 50, "username");
                      },
                      mycontroller: controller.skills,
                      hinttext: "skills",
                      labeltext: "skills",
                      iconData: Icons.person,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 50, "username");
                      },
                      mycontroller: controller.certificates,
                      hinttext: "certificates",
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
