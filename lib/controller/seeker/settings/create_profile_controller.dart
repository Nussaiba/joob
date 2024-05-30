import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/seeker/profile/profile_seeker.dart';

abstract class CreateProfileController extends GetxController {
  createProfile();
  getImage();
  pickBirthday(BuildContext context);
}

class CreateProfileControllerImp extends CreateProfileController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? username;
  String? email;
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController location;
  late TextEditingController skills;
  late TextEditingController certificates;
  late TextEditingController about;
  File? image;
  DateTime? birthday1;

  StatusRequest statusRequest = StatusRequest.none;
  ProfileData profileData = ProfileData(Get.find());
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
      print("nooo");
    }
  }

  @override
  void pickBirthday(context) async {
    DateTime initialDate = birthday1 ?? DateTime.now();
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.praimaryColor,
            colorScheme: const ColorScheme.light(
              primary: AppColor.praimaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != birthday1) {
      birthday1 = pickedDate;
      update();
    }
  }

  @override
  createProfile() async {
    //if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response = await profileData.createPostdata(
        firstname.text,
        lastname.text,
        birthday1!.toString(),
        location.text,
        image!,
        skills.text,
        certificates.text,
        about.text);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        myServices.box.write("firstname", firstname.text);
        myServices.box.write("lastname", lastname.text);
        myServices.box.write("birthday", birthday1.toString());
        myServices.box.write("location", location.text);
        myServices.box.write("imagepath", image!.path);
        myServices.box.write("skills", skills.text);
        myServices.box.write("certificates", certificates.text);
        myServices.box.write("about", about.text);
        myServices.box.write("step", "3");

        Get.offNamed(
          AppRoute.login,
        );
        return Get.snackbar("success", "Welcolme ",
            colorText: Colors.white,
            backgroundColor: AppColor.praimaryColor,
            duration: const Duration(seconds: 3));
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "User already has a seeker job.");
      }
    }
    update();

    //  } else {}
  }

  initialData() {
    email = myServices.box.read("email");
    username = myServices.box.read("user_name");
  }

  @override
  void onInit() {
    initialData();
    firstname = TextEditingController();
    lastname = TextEditingController();
    location = TextEditingController();
    skills = TextEditingController();
    certificates = TextEditingController();
    about = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    location.dispose();
    skills.dispose();
    certificates.dispose();
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
