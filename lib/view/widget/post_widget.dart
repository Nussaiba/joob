import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
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
    required this.textviewmore, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(AppImageAsset.onBoardingImgThree),
            ),
            title: const Text("person name"),
            subtitle:
                Text(postmodel.createdat!, style: const TextStyle(height: 0.5)),
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
                            value: 'delete', child: Text("Delete")),
                        const PopupMenuItem(
                            value: 'report', child: Text("Report")),
                      ]
                    : <PopupMenuEntry<String>>[
                        const PopupMenuItem(
                            value: 'report', child: Text("Report")),
                      ];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: RichText(
              text: TextSpan(
                  style: const TextStyle(
                      fontSize: 16.0, color: Colors.grey, height: 1.5),
                  children: [
                    TextSpan(
                      text:text,
                      
                      //  isExpanded
                      //     ? postmodel.body!
                      //     : postmodel.body!.substring(0, 3),
                    
                    ),
                    TextSpan(
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.grey),
                      text: textviewmore,

                      //isExpanded ? 'view less' : 'view more',
                      // controller.isExpanded.value
                      //     ? 'عرض أقل'
                      //     : 'عرض المزيد',
                      recognizer: TapGestureRecognizer()..onTap = onTapExpanded,
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
            // symmetric(horizontal: 10, vertical: 4),
            child: postmodel.file != null
                ? Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                            "${AppLink.serverimage}/${postmodel.file}",
                            width: Get.width,
                            fit: BoxFit.cover),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: CircleAvatar(
                      //     backgroundColor: AppColor.grey,
                      //     child: IconButton(
                      //       icon: const Icon(Icons.bookmark_border),
                      //       color: Colors.white,
                      //       onPressed: () {},
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
