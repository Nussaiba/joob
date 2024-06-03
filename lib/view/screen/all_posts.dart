// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jobs/controller/get_all_opportunity_posts.dart';
// import 'package:jobs/core/class/handlingdataview.dart';
// import 'package:jobs/core/constants/color.dart';
// import '../widget/post_widget.dart';

// class PostsView extends StatelessWidget {
//   const PostsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(GetPostsAndOpportunityControllerImp());

//     return GetBuilder<GetPostsAndOpportunityControllerImp>(
//       builder: (controller) => Scaffold(
//         backgroundColor: AppColor.grey.withOpacity(0.3),
//         appBar: AppBar(
//             backgroundColor: AppColor.praimaryColor,
//             title:
//                 const Text('Posts', style: TextStyle(color: AppColor.white))),
//         body: HandlingDataView(
//           statusRequest: controller.statusRequest,
//           widget: ListView.builder(
//             controller: controller.scrollController,
//             itemCount: controller.postsList.length,
//             itemBuilder: (context, index) {
//               return CustomPostWidget(
//                 postmodel: controller.postsList[index],
//                 onTapExpanded: controller.toggleExpanded,
//                 isExpanded: controller.isExpanded.value,
//                 onSelected: (value) {
//                   switch (value) {
//                     case 'edit':
//                       controller.editPost();
//                       break;
//                     case 'delete':
//                       controller.deletePost();
//                       break;
//                     case 'report':
//                       controller.reportPost();
//                       break;
//                   }
//                 },
//                 isOwner: controller.postsList[index].id ==
//                     controller.idUserPostOwner,
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
