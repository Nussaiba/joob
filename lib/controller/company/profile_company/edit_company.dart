import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/company/profile_company_data.dart';

abstract class UpdateProfileCompanyController extends GetxController {
  updateProfile();
  getImage();
}

class UpdateProfileCompanyControllerImp extends UpdateProfileCompanyController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController? namecompany;
  late TextEditingController? location;
  File? image;
  late TextEditingController? contactInfo;
  late TextEditingController? about;
  MyServices myServices = Get.find();
  String? nameCompanySave;
  String? locationSave;
  String? aboutSave;
  String? contactInfoSave;
  String? imagepathSave;
  StatusRequest statusRequest = StatusRequest.none;
  CompanyProfileData profileData = CompanyProfileData(Get.find());
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
  updateProfile() async {
    //if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111  Controller");
    var response = await profileData.updatePostdata(
      namecompany == null ? nameCompanySave! : namecompany!.text,
      location == null ? locationSave! : location!.text,
      image == null ? getImageSaved()! : image!,
      about == null ? aboutSave! : about!.text,
      contactInfo == null ? contactInfoSave! : contactInfo!.text,
    );
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        myServices.box.write(
          "name",
          namecompany == null ? nameCompanySave! : namecompany!.text,
        );
        myServices.box.write(
          "location",
          location == null ? locationSave! : location!.text,
        );
        myServices.box.write(
          "imagepath",
          image == null ? getImageSaved()!.path : image!.path,
        );
        myServices.box.write(
          "about",
          about == null ? aboutSave! : about!.text,
        );
        myServices.box.write(
          "contactinfo",
          contactInfo == null ? contactInfoSave! : contactInfo!.text,
        );
        getDialog("yes", "yesss");
        Get.offNamed(AppRoute.profilePage);
      }
    }
    update();

    //  } else {}
  }

  File? getImageSaved() {
    if (imagepathSave != null) {
      return File(imagepathSave!);
    }
    return null;
  }

  initialData() {
    nameCompanySave = myServices.box.read("name");
    locationSave = myServices.box.read("location");
    imagepathSave = myServices.box.read("imagepath");
    contactInfoSave = myServices.box.read("contactinfo");
    aboutSave = myServices.box.read("about");
  }

  @override
  void onInit() {
    initialData();
    namecompany = TextEditingController();
    location = TextEditingController();
    contactInfo = TextEditingController();
    about = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    namecompany!.dispose();
    location!.dispose();
    contactInfo!.dispose();
    about!.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    image!.delete();
    super.onClose();
  }
}
