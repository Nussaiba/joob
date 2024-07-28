import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/general/choose_image.dart';
import 'package:jobs/data/datasource/remote/general/convert_image_to_file.dart';
import 'package:jobs/data/datasource/remote/home/home.dart';
import 'package:jobs/data/model/post_model.dart';
import 'package:jobs/view/widget/general/custom_button_with_icon.dart';
import 'package:open_file/open_file.dart';
import '../../../data/datasource/remote/seeker/createpost_data.dart';

abstract class EditPostController extends GetxController {
  editPost(int id);
  getImage();
}

class EditPostControllerImp extends EditPostController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late PostModel postmodel;
  File? selectedFile;
  String? contentType;
  StatusRequest statusRequest = StatusRequest.none;
  PostData postData = PostData(Get.find());
  MyServices myServices = Get.find();
  late TextEditingController bodyPost;
  String? path;
  HomeData homeData = HomeData(Get.find());
  FileData fileData = FileData(Get.find());
  ImageAndFileData imageData = ImageAndFileData(Get.find());
  ImageAndFileData imageAndFileData = ImageAndFileData(Get.find());

  @override
  getImage() async {
    selectedFile = await imageData.getImageData();
    path = null;
    contentType = 'image';
    update();
  }

  Future<void> pickFile() async {
   
    contentType = 'file';
    path = null;

    selectedFile = await File(await imageAndFileData.pickFileData());
    update();
  }

  editPost(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    print(
        " contentType  $contentType,  path $path , selectedFile $selectedFile  ");
    var response = await postData.editPostdata(
        id,
        bodyPost.text,
        selectedFile == null && path != null
            ? await fileData.downloadImage(path!)
            : selectedFile != null
                ? selectedFile
                : null,
        contentType);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        Get.find<GetPostsAndOpportunityControllerImp>().getPostsData();
        update();
        getSnakBar("24".tr,  "${response["message"]}" , 3);
        Get.offAllNamed(AppRoute.mainScreens);
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
              onPressed: () async {
                await getImage();
                print(
                    "   after   contentType  $contentType,  path $path , selectedFile $selectedFile   ");
                update();
                Get.back();
              },
              icon: Icons.image,
              title: "209".tr,
            ),
            SizedBox(height: 10),
            CustomButtonWithIcon(
              onPressed: () async {
                await pickFile();
                print(
                    "   after   contentType  $contentType,  path $path , selectedFile $selectedFile   ");
                Get.back();
                update();
              },
              icon: Icons.attach_file,
              title: "210".tr,
            ),
          ],
        ));
  }

  Future download(String url, String fileName) async {
    String pdfurl = '${AppLink.serverimage}/$url';

    //isLoading[pdfurl] = true;
    update();
    File file = await homeData.getFile(url, fileName);
    // await Future.delayed(Duration(seconds: 2));
    //isLoading[pdfurl] = false;
    update();
    await OpenFile.open(file.path);
  }

  void openSelectedFile() async {
    
       await imageAndFileData.openSelectedFile(selectedFile!.path);

  }

  @override
  void onInit() {
    postmodel = Get.arguments['postmodel'];
    bodyPost = TextEditingController(text: postmodel.body);
    //selectedFile = File("${postmodel.file}");
    path = postmodel.file;
    print(path);
    contentType = postmodel.type;
    super.onInit();
  }

  @override
  void dispose() {
    //bodyPost.dispose();
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
