import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/data/model/post_model.dart';

class CustomPostWidget extends StatelessWidget {
  final PostModel postmodel;
  final void Function()? onTapExpanded;
  final bool isExpanded;
  final bool isOwner;
  final String text;
  final String textviewmore;
  final bool isLoudingPdf;
  final void Function()? onPressedDownload;
  final Function()? onTapGoToProfile;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;
  final void Function()? onPressedReport;
  final void Function(String)? onSelected;
  const CustomPostWidget({
    super.key,
    required this.postmodel,
    this.onTapExpanded,
    required this.isExpanded,
    required this.isOwner,
    required this.textviewmore,
    required this.text,
    required this.isLoudingPdf,
    this.onPressedDownload,
    this.onTapGoToProfile,
    this.onPressedEdit,
    this.onPressedDelete,
    this.onPressedReport,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: AppColor.White(), borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: onTapGoToProfile,
              child: ListTile(
                leading: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: AppColor.praimaryColor),
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: postmodel.profileImg == null
                        ? Image.asset(AppImageAsset.onBoardingImgThree)
                        : Image.network(
                            "${AppLink.serverimage}/${postmodel.profileImg}",
                            fit: BoxFit.cover),
                  ),
                ),
                title: Text(postmodel.createdby!,
                    style: TextStyle(
                        fontFamily: "Gafata",
                        height: 2,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.TextColor())),
                subtitle: Text(postmodel.createdat!.substring(0, 10),
                    style: TextStyle(
                        fontFamily: "Gafata",
                        height: 0.5,
                        fontSize: 14,
                        color: AppColor.TextColor())),
                trailing: PopupMenuButton<String>(
                  iconColor: AppColor.grey,
                  color: AppColor.Grey(),
                  onSelected: onSelected,
                  itemBuilder: (BuildContext context) {
                    return isOwner
                        ? <PopupMenuEntry<String>>[
                            PopupMenuItem(
                              value: 'edit',
                              child: Text("121".tr),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text("208".tr),
                            ),
                          ]
                        : <PopupMenuEntry<String>>[
                            PopupMenuItem(
                              value: 'report',
                              child: Text("100".tr),
                            ),
                          ];
                  },
                ),

                // PopUpMenu(
                //   isOwner: isOwner,
                //   onPressedReport: onPressedReport,
                //   onPressedDelete: onPressedDelete,
                //   onPressedEdit: onPressedEdit,
                //   onSelected: (value) {
                //     switch (value) {
                //       case 'edit':
                //         () {
                //           print("jjjjjjjjjjjjjjjjjjjjjjj");
                //           onPressedEdit;
                //         };
                // controller.goToEditPage(
                //         //     controller.opportuntiyModel);
                //         break;
                //       case 'delete':
                //         () {
                //           onPressedDelete;
                //         };
                //         // controller.deleteOpportunity(
                //         //     controller.opportuntiyModel.id!);
                //         break;
                //       case 'report':
                //         () {
                //           onPressedReport;
                //         };
                //         // controller.reportUser(controller.companyModel.id!);
                //         break;
                //     }
                //   },
                // ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 16.0,
                        color: AppColor.TextColor(),
                        height: 1.45),
                    children: [
                      TextSpan(
                        text: text,
                      ),
                      TextSpan(
                        style:
                            const TextStyle(fontSize: 16.0, color: Colors.grey),
                        text: textviewmore,
                        recognizer: TapGestureRecognizer()
                          ..onTap = onTapExpanded,
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
              child: postmodel.file != null && postmodel.type == 'image'
                  ? SizedBox(
                      width: Get.width,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                            "${AppLink.serverimage}/${postmodel.file}",
                            width: Get.width,
                            fit: BoxFit.contain),
                      ),
                    )
                  : postmodel.file != null && postmodel.type == 'file'
                      ? Card(
                          elevation: 1,
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            leading: Icon(Icons.picture_as_pdf,
                                size: 35, color: Colors.red),
                            title: Text(
                              postmodel.file!.split('/').last,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            trailing: Stack(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.file_download),
                                  onPressed: onPressedDownload,
                                ),
                                isLoudingPdf
                                    ? Positioned.fill(
                                        child: CircularProgressIndicator())
                                    : Container(
                                        child: Text(
                                          " ",
                                          style: TextStyle(fontSize: 0),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
