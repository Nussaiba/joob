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

  List<String> language = <String>[].obs;
  List<String> skills = <String>[].obs;
  List<String> certificates = <String>[].obs;
  List<String> projects = <String>[].obs;
  List<String> experiences = <String>[].obs;
  List<String> contacts = <String>[].obs;
  List<String> profile = <String>[].obs;

  create() async {
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
   
    super.onInit();
  }
}
