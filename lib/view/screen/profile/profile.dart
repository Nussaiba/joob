import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/settings/update_profile_controller.dart';
import 'package:jobs/core/constants/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
        Get.put(UpdateProfileControllerImp());

    return Scaffold(
      body: GetBuilder<UpdateProfileControllerImp>(builder: (controller)=>
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
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
                                ),)),
        Text(controller.firstName!),
                Text(controller.lastName!),
        Text(controller.Birthday!.toString()),
        Text(controller.Location!),
        Text(controller.Skills!),
        Text(controller.Certificates!),
       

      ],)),
    
    );
  }
}