
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jobs/core/constants/imageassest.dart';
// import 'package:jobs/data/model/post_model.dart';

// class CardPostHome extends StatelessWidget {
//   final PostModel postmodel;
//   final void Function(String)? onSelected;
//   final bool isOwner;
//   final String textPost;
//   //final String textviewmore;
//   const CardPostHome({
//     super.key, required this.postmodel, this.onSelected, required this.isOwner, required this.textPost,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//           color: Colors.white70, borderRadius: BorderRadius.circular(14)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           ListTile(
//             leading: const CircleAvatar(
//               backgroundImage: AssetImage(AppImageAsset.onBoardingImgThree),
//             ),
//             title: const Text("person name"),
//             subtitle: const Text("createdat!", style: TextStyle(height: 0.5)),
//             trailing: PopupMenuButton<String>(
//               // onSelected: onSelected,
//               itemBuilder: (BuildContext context) {
//                 return <PopupMenuEntry<String>>[
//                   const PopupMenuItem(
//                     value: 'edit',
//                     child: Text("Edit"),
//                   ),
//                   const PopupMenuItem(value: 'delete', child: Text("Delete")),
//                   const PopupMenuItem(value: 'report', child: Text("Report")),
//                 ];
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4.0),
//             child: RichText(
//               text: const TextSpan(
//                   style: TextStyle(
//                       fontSize: 16.0, color: Colors.grey, height: 1.5),
//                   children: [
//                     TextSpan(
//                       text: "hhhhv gghg hh ",

//                       //  isExpanded
//                       //     ? postmodel.body!
//                       //     : postmodel.body!.substring(0, 3),
//                     ),
//                     TextSpan(
//                       style: TextStyle(fontSize: 16.0, color: Colors.grey),
//                     ),
//                   ]),
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
//               // symmetric(horizontal: 10, vertical: 4),
//               child: SizedBox(
//                 width: Get.width,
//                 height: 160,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(14),
//                   child: Image.asset(
//                       // "${AppLink.serverimage}/${postmodel.file}",
//                       AppImageAsset.onBoardingImgSix,
//                       width: Get.width,
//                       fit: BoxFit.contain),
//                 ),
//               )
              
//               ),
//         ],
//       ),
//     );
//   }
// }
