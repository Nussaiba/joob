import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/seeker/post/edie_post.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/post/chosen_image_card.dart';
import 'package:jobs/view/widget/post/chosen_pdf_card.dart';
import 'package:jobs/view/widget/post/show_image_card.dart';
import 'package:jobs/view/widget/post/show_pdf_card.dart';

class EditPostPage extends StatelessWidget {
  EditPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditPostControllerImp());
    return GetBuilder<EditPostControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(
                  "121".tr,
                  style: TextStyle(color: AppColor.white),
                ),
                backgroundColor: AppColor.PraimaryColor(),
                iconTheme: IconThemeData(color: AppColor.White()),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      controller.editPost(controller.postmodel.id!);
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.bodyPost,
                          decoration: InputDecoration(
                            hintText: "118".tr,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8.0),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      ),
                      const SizedBox(height: 20),
                      controller.path != null &&
                              controller.selectedFile == null &&
                              controller.contentType == 'image'
                          ? ShowImageCard(
                              imageName: controller.path!,
                              onPressedDelete: () => {controller.deleteFile()},
                            )
                          : controller.path != null &&
                                  controller.selectedFile == null &&
                                  controller.contentType == 'file'
                              ? ShowPdfCard(
                                  onTapDownload: () async {
                                    await controller.download(
                                        '${controller.path}',
                                        '${controller.path!.split("/").last}.pdf');
                                  },
                                  pdfName: controller.path!.split('/').last,
                                  onPressedDelete: () =>
                                      {controller.deleteFile()},
                                )
                              : controller.selectedFile != null &&
                                      controller.contentType == 'file'
                                  ? ChosenPdfCard(
                                      pdfName: controller.selectedFile!.path
                                          .split('/')
                                          .last,
                                      onTapOpen: () =>
                                          controller.openSelectedFile(),
                                      onPressedDelete: () =>
                                          {controller.deleteFile()},
                                    )
                                  :
                                  //controller.path == null&&
                                  controller.selectedFile != null &&
                                          controller.contentType == 'image'
                                      ? ChosenImageCard(
                                          image: controller.selectedFile!,
                                          onPressedDelete: () =>
                                              {controller.deleteFile()})
                                      : Container(
                                          decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ))
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.PraimaryColor(),
                focusColor: AppColor.White(),
                foregroundColor: AppColor.White(),
                onPressed: () {
                  controller.choose();
                },
                tooltip: "120".tr,
                child: const Icon(Icons.attach_file),
              ),
            ));
  }
}
