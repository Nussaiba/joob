import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/company/profile_company_data.dart';

abstract class CreateProfileCompanyController extends GetxController {
  createProfile();
  getImage();
}

class CreateProfileCompanyControllerImp extends CreateProfileCompanyController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  File? image;
  late TextEditingController companyname;
  late TextEditingController location;
  late TextEditingController contactInfo;
  late TextEditingController about;
  String? companyName;
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  CompanyProfileData profileData = CompanyProfileData(Get.find());
  MyServices myServices = Get.find();
  final picker = ImagePicker();
  @override
  Future getImage() async {
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      image = File(pickedfile.path);
      print(image);
      print(image!.path);
      print(image!.path.split("/").last);
      update();
    } else {
      print("no Image");
    }
  }

  @override
  createProfile() async {
    //if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response = await profileData.createPostdata(
        companyname.text, location.text, image!, about.text, contactInfo.text);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        myServices.box.write("companyname", companyname.text);
        myServices.box.write("companylocation", location.text);
        myServices.box.write("imagepath", image!.path);
        myServices.box.write("contactInfo", contactInfo.text);
        myServices.box.write("about", about.text);
        myServices.box.write("step", "3");
 
            Get.offAllNamed(AppRoute.login);
          
        return Get.snackbar("success", "Welcolme ",
            colorText: Colors.white,
            backgroundColor: AppColor.praimaryColor,
            duration: const Duration(seconds: 3));
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Company already has a company job.");
      }
    }
    update();

    //  } else {}
  }

  initialData() {
    // email = myServices.box.read("email");
    // companyName = myServices.box.read("companyname");
  }

  @override
  void onInit() {
    initialData();
    companyname = TextEditingController();
    contactInfo = TextEditingController();
    location = TextEditingController();
    about = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    companyname.dispose();
    contactInfo.dispose();
    location.dispose();
    about.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    if (image != null) {
      image!.delete();
    }
    super.onClose();
  }
}
