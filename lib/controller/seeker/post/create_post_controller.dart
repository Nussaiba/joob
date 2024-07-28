import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/general/choose_image.dart';
import 'package:jobs/data/model/post_model.dart';
import 'package:jobs/view/widget/general/custom_button_with_icon.dart';
import '../../../data/datasource/remote/seeker/createpost_data.dart';

abstract class CreatePostController extends GetxController {
  createPost();
  getImage();
}

class CreatePostControllerImp extends CreatePostController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController bodyPost;
  ImageAndFileData imageData = ImageAndFileData(Get.find());
  File? selectedFile;

  String? contentType;

  StatusRequest statusRequest = StatusRequest.none;
  PostData postData = PostData(Get.find());
  MyServices myServices = Get.find();
  ImageAndFileData imageAndFileData = ImageAndFileData(Get.find());

  @override
  getImage() async {
    selectedFile = await imageData.getImageData();
    update();
  }

  Future<void> pickFile() async {
    selectedFile = await File(await imageAndFileData.pickFileData());
    update();
  }

  goToEditPage(PostModel postmodel) {
    Get.toNamed(AppRoute.editpostpage, arguments: {'postmodel': postmodel});
  }

  @override
  createPost() async {
    //if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response =
        await postData.createPostdata(bodyPost.text, selectedFile, contentType);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
         Get.lazyPut<GetPostsAndOpportunityControllerImp>;
        update();
        getSnakBar("24".tr, "${response["message"]}", 3);
        Get.offAllNamed(AppRoute.mainScreens);
      } else {
        Get.defaultDialog(
            title: "203".tr, middleText: "${response["message"]}");
      }
    }
    update();

    //  } else {}
  }

  deletePost(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    var response = await postData.deletePost(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        Get.find<GetPostsAndOpportunityControllerImp>().getPostsData();
        update();
        getSnakBar("24".tr,  "${response["message"]}" , 3);
        
      } else {
  getDialog("203".tr, "${response["message"]}");        
      }
    }
  }

  void deleteFile() {
    selectedFile = null;
    contentType = null;
    update();
  }

  void openSelectedFile() async {
    await imageAndFileData.openSelectedFile(selectedFile!.path);
  }

  choose() {
    Get.defaultDialog(
        backgroundColor: AppColor.Backgroundcolor(),
        titleStyle: TextStyle(
          color: AppColor.TextColor(),
        ),
        title: "120".tr,
        content: Column(
          children: [
            CustomButtonWithIcon(
              onPressed: () {
                contentType = 'image';
                getImage();
                update();
                Get.back();
              },
              icon: Icons.image,
              title: "209".tr,
            ),
            SizedBox(height: 10),
            CustomButtonWithIcon(
              onPressed: () {
                contentType = 'file';
                pickFile();
                Get.back();
                update();
              },
              icon: Icons.attach_file,
              title: "210".tr,
            ),
          ],
        ));
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
    if (selectedFile != null) {
      selectedFile!.delete();
    }
    super.onClose();
  }
}
