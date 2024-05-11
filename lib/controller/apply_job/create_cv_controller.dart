import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/crud.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/cv/cv_data.dart';
import 'package:path_provider/path_provider.dart';

class CreateCvController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  CvData cvData = CvData(Get.put(Crud()));
  MyServices myServices = Get.find();
  String? firstName;
  String? lastName;
  String? Birthday;
  String? Location;
  String? imagepath;
  late List<TextEditingController> language;
  late List<TextEditingController> skills;
  late List<TextEditingController> certificates;
  late List<TextEditingController> projects;
  late List<TextEditingController> experiences;
  late List<TextEditingController> contacts;
  late List<TextEditingController> profile;
  var focuseslanguages = <FocusNode>[].obs;
  var focusesskills = <FocusNode>[].obs;
  var focusescertificates = <FocusNode>[].obs;
  var focusesprojects = <FocusNode>[].obs;
  var focusesexperiences = <FocusNode>[].obs;
  var focusescontacts = <FocusNode>[].obs;
  var focusesprofile = <FocusNode>[].obs;

  void addLanguages(List<TextEditingController> list) {
    var flanguage = FocusNode();
    focuseslanguages.add(flanguage);
    list.add(TextEditingController());
    update();
    Future.delayed(const Duration(milliseconds: 100), () {
      flanguage.requestFocus();
    });
  }

  void addSkills(List<TextEditingController> list) {
    var fskills = FocusNode();
    focusesskills.add(fskills);
    list.add(TextEditingController());
    update();
    Future.delayed(Duration(milliseconds: 100), () {
      fskills.requestFocus();
    });
  }

  void addcertificates(List<TextEditingController> list) {
    var fcertificates = FocusNode();
    focusescertificates.add(fcertificates);
    list.add(TextEditingController());
    update();
    Future.delayed(Duration(milliseconds: 100), () {
      fcertificates.requestFocus();
    });
  }

  void addprojects(List<TextEditingController> list) {
    var fprojects = FocusNode();
    focusesprojects.add(fprojects);
    list.add(TextEditingController());
    update();
    Future.delayed(Duration(milliseconds: 100), () {
      fprojects.requestFocus();
    });
  }

  void addexperiences(List<TextEditingController> list) {
    var fexperiences = FocusNode();
    focusesexperiences.add(fexperiences);
    list.add(TextEditingController());
    update();
    Future.delayed(Duration(milliseconds: 100), () {
      fexperiences.requestFocus();
    });
  }

  void addcontacts(List<TextEditingController> list) {
    var fcontacts = FocusNode();
    focusescontacts.add(fcontacts);
    list.add(TextEditingController());
    update();
    Future.delayed(Duration(milliseconds: 100), () {
      fcontacts.requestFocus();
    });
  }

  createcv() async {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response = await cvData.postCvData(
        skills, certificates, language, projects, experiences, contacts);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      final bytes = response.bodyBytes;
      print(bytes);
      final buffer = bytes.buffer;
      print(buffer);
      final appStore =
          await getExternalStorageDirectory().whenComplete(() => print('LLLL'));
      final docpath = appStore!.path;
      print(docpath);
      File fileCv = File('$docpath/cv.pdf');
      print(fileCv);
      await fileCv.writeAsBytes(buffer.asUint8List());
      print(fileCv);
      await OpenFile.open(fileCv.path).whenComplete(() => print("CV"));
      update();
    }
  }

  initialData() {
    firstName = myServices.box.read("firstname");
    lastName = myServices.box.read("lastname");
    Birthday = myServices.box.read("birthday");
    Location = myServices.box.read("location");
    imagepath = myServices.box.read("imagepath");
  }

  @override
  void onInit() {
    initialData();
    language = <TextEditingController>[].obs;
    skills = <TextEditingController>[].obs;
    certificates = <TextEditingController>[].obs;
    projects = <TextEditingController>[].obs;
    experiences = <TextEditingController>[].obs;
    contacts = <TextEditingController>[].obs;
    profile = <TextEditingController>[].obs;

    super.onInit();
  }

  @override
  void onClose() {
    for (var element in focuseslanguages) {
      element.dispose();
    }
    for (var element in language) {
      element.dispose();
    }
    projects.forEach((element) {
      element.dispose();
    });
    skills.forEach((element) {
      element.dispose();
    });

    super.onClose();
  }
}
