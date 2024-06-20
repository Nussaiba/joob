import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import '../../data/model/post_model.dart';

class CustomPostWidget extends StatelessWidget {
  final PostModel postmodel;
  final void Function()? onTapExpanded;
  final bool isExpanded;
  final void Function(String)? onSelected;
  final bool isOwner;
  final String text;
  final String textviewmore;
  const CustomPostWidget({
    super.key,
    required this.postmodel,
    this.onTapExpanded,
    required this.isExpanded,
    required this.onSelected,
    required this.isOwner,
    required this.textviewmore,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColor.praimaryColor),
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                  //radius: 50,
                  //backgroundColor: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(50),
                  child: postmodel.profileImg == null
                      ? Image.asset(AppImageAsset.onBoardingImgThree)
                      : Image.network(
                          "${AppLink.serverimage}/${postmodel.profileImg}"),
                ),
              ),
              title: Text(postmodel.createdby!),
              subtitle:
                  Text(postmodel.createdat!.substring(0,10), style: const TextStyle(height: 0.5)),
              trailing: PopupMenuButton<String>(
                onSelected: onSelected,
                itemBuilder: (BuildContext context) {
                  return isOwner
                      ? <PopupMenuEntry<String>>[
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text("Edit"),
                             
                          ),
                          const PopupMenuItem(
                              value: 'delete', 
                              child: Text("Delete")),
                          const PopupMenuItem(
                              value: 'report',
                               child: Text("Report")),
                        ]
                      : <PopupMenuEntry<String>>[
                          const PopupMenuItem(
                              value: 'report',
                               child: Text("Report")),
                        ];
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                text: TextSpan(
                    style: const TextStyle(
                        fontSize: 16.0, color: Colors.grey, height: 1.5),
                    children: [   
                      TextSpan(
                        text: text,
                      ),
                      TextSpan(
                        style:
                            const TextStyle(fontSize: 16.0, color: Colors.grey),
                        text: textviewmore,
                        recognizer: TapGestureRecognizer()..onTap = onTapExpanded,
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
              child: postmodel.file != null
                  ? SizedBox(
                  width: Get.width,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                        // "${AppLink.serverimage}/${postmodel.file}",
                        AppImageAsset.onBoardingImgSix,
                        width: Get.width,
                        fit: BoxFit.contain),
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
