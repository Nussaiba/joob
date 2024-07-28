import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/seeker/post/create_post_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/post/chosen_image_card.dart';
import 'package:jobs/view/widget/post/chosen_pdf_card.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreatePostControllerImp());
    return GetBuilder<CreatePostControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(
                  "117".tr,
                  style: TextStyle(color: AppColor.white),
                ),
                backgroundColor: AppColor.praimaryColor,
                iconTheme: IconThemeData(color: AppColor.white),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      controller.createPost();
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
                      controller.selectedFile != null &&
                              controller.contentType == 'image'
                          ? ChosenImageCard(
                              image: controller.selectedFile!,
                              onPressedDelete: () => {controller.deleteFile()})
                          : controller.selectedFile != null &&
                                  controller.contentType == 'file'
                              ? ChosenPdfCard(
                                  pdfName: '${controller.selectedFile!.path}',
                                  onTapOpen: () =>
                                      controller.openSelectedFile(),
                                  onPressedDelete: () =>
                                      {controller.deleteFile()},
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                      const SizedBox(height: 20),
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
