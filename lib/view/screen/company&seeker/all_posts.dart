import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/get_all_opportunity_posts_home.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import '../../widget/post_widget.dart';

class AllPostPage extends StatelessWidget {
  AllPostPage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(GetPostsAndOpportunityControllerImp());

    return GetBuilder<GetPostsAndOpportunityControllerImp>(
      builder: (controller) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColor.grey.withOpacity(0.3),
        appBar: AppBar(
            backgroundColor: AppColor.praimaryColor,
            title:
                const Text('Posts', style: TextStyle(color: AppColor.white))),
        body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.postsList.length,
              itemBuilder: (context, index) {
                return CustomPostWidget(
                  postmodel: controller.postsList[index],
                  onTapExpanded: controller.toggleExpanded,
                  isExpanded: controller.isExpanded.value,
                  textviewmore:
                      controller.isExpanded.value ? 'view less' : 'view more',
                  text: controller.isExpanded.value
                      ? controller.postsList[index].body!
                      : controller.postsList[index].body!.substring(0, 3),
                   onSelected: controller.selecedAnOption,
                  
                  // (value) {
                  //   switch (value) {
                  //     case 'edit':
                  //       controller.editPost();
                  //       break;
                  //     case 'delete':
                  //       controller.deletePost();
                  //       break;
                  //     case 'report':
                  //       controller.reportPost();
                  //       break;
                  //   }
                 // },
                  isOwner: controller.postsList[index].seekerid ==
                      controller.idUserPostOwner,
                );
              },
            )),
        floatingActionButton: controller.isFabVisible.value && controller.account == 'job_seeker'?
            Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: FloatingActionButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.postpage);
                  },
                  child: const Icon(Icons.add),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
