import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';

import '../../data/datasource/remote/seeker/createpost_data.dart';

abstract class CreatePostController extends GetxController {
  createPost();
  getImage();
}

class CreatePostControllerImp extends CreatePostController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController bodyPost;
  File? image;

  StatusRequest statusRequest = StatusRequest.none;
  PostData postData = PostData(Get.find());
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
  createPost() async {
    //if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response = await postData.createPostdata(
      bodyPost.text,
      image,
    );
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        Get.offNamed(
          AppRoute.mainScreens,
        );
        return Get.snackbar("success", "Post Create Successfully",
            colorText: Colors.white,
            backgroundColor: AppColor.praimaryColor,
            duration: const Duration(seconds: 3));
      } else {
        // Get.defaultDialog(
        //   title: "Warning", middleText: "User already has a seeker job.");
      }
    }
    update();

    //  } else {}
  }

  @override
  void onInit() {
    bodyPost = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    bodyPost.dispose();
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
