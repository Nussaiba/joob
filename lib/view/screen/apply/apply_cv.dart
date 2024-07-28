import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/apply/apply_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import 'package:jobs/view/widget/auth/textsignup.dart';
import 'package:jobs/view/widget/general/custom_button_with_icon.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import 'package:lottie/lottie.dart';

class ApplyCV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ApplyControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "188".tr,
          style: TextStyle(color: AppColor.white),
        ),
        iconTheme: IconThemeData(
          color: AppColor.white,
        ),
        backgroundColor: AppColor.PraimaryColor(),
      ),
      body: GetBuilder<ApplyControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextTitle(
                        text: "189".tr,
                      ),
                      Center(
                        child: Lottie.asset(AppImageAsset.cv,
                            width: 250, height: 250),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      FadeAnimation(CustomTextBody(text: "190".tr), 0.5),
                      const SizedBox(
                        height: 25,
                      ),
                      FadeAnimation(
                          CustomButtonWithIcon(
                            onPressed: () {
                              controller.pickFile();
                            },
                            icon: Icons.upload_file,
                            title: "191".tr,
                          ),
                          0.8),
                      const SizedBox(
                        height: 25,
                      ),
                      controller.selectedFilePath != null
                          ? Card(
                              child: ListTile(
                                leading: Icon(Icons.picture_as_pdf,
                                    size: 35, color: Colors.red),
                                title: Text(
                                  controller.selectedFilePath!.split('/').last,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text("119".tr),
                                onTap: () => controller.openSelectedFile(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 15),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                  child: Text(
                                "192".tr,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Divider(),
                      ),
                      CustomTextSignUpOrSignIn(
                          textone: "193".tr, texttwo: "194".tr, onTap: () {}),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButtomAuth(
                          color: controller.selectedFilePath != null
                              ? AppColor.praimaryColor
                              : AppColor.grey,
                          text: "195".tr,
                          onPressed: () {
                            controller.selectedFilePath != null
                                ? controller.applyCV()
                                : null;
                          }),
                    ],
                  ),
                ),
              )),
    );
  }
}
