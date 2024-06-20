import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/general/side_bar_controller.dart';
import 'package:jobs/controller/get_all_opportunity_posts_home.dart';
import 'package:jobs/controller/saved_opportunity_controller.dart';
import 'package:jobs/view/widget/home_widgets/app_bar_home.dart';
import 'package:jobs/view/widget/home_widgets/job_card_home.dart';
import 'package:jobs/view/widget/home_widgets/side_barx.dart';
import 'package:jobs/view/widget/post_widget.dart';

class CompanyHome extends StatelessWidget {
  CompanyHome({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(GetPostsAndOpportunityControllerImp());
    Get.put(SavedController());
    final sidebarcontroller = Get.put(SideBarController());
    return GetBuilder<GetPostsAndOpportunityControllerImp>(
        builder: (controller) => Scaffold(
              key: _scaffoldKey,
              body: Obx(
                () => GestureDetector(
                  onTap: () {
                    sidebarcontroller.isShow.value ? sidebarcontroller.toggleShow() : null;
                  },
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          AppBarHome(
                            controller: sidebarcontroller,
                            text: 'Public Your Opportuniies',
                          ),
                          TitleOpportunitiesHome(
                            title: "Opportunities",
                            onTapViewAll: () {
                              controller.goToPageAllOpportunities();
                            },
                          ),
                          SizedBox(
                            height: 195,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.opportuntiesList.length,
                              itemBuilder: (context, index) {
                                return GetBuilder<SavedController>(
                                    builder: (jobController) {
                                  final isSaved = jobController.isSaved(
                                      controller.opportuntiesList[index].id!);

                                  return JobCardHome(
                                    opportuntiyModel:
                                        controller.opportuntiesList[index],
                                    onPressed: () =>
                                        controller.goToPageOpportunityDetails(
                                            controller.opportuntiesList[index]),
                                    icon: isSaved
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    onTapIcon: () async {
                                      await jobController
                                          .addOrRemoveToSavedOpportunity(
                                              controller
                                                  .opportuntiesList[index].id!);
                                    },
                                  );
                                });
                              },
                            ),
                          ),
                          TitleOpportunitiesHome(
                            title: "Posts",
                            onTapViewAll: () {
                              controller.goToPageAllPosts();
                            },
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.postsList.length,
                            itemBuilder: (context, i) {
                              return CustomPostWidget(
                                postmodel: controller.postsList[i],
                                onTapExpanded: controller.toggleExpanded,
                                isExpanded: controller.isExpanded.value,
                                textviewmore: '',
                                // controller.isExpanded.value
                                //     ? 'view less'
                                //     : 'view more',
                                text: controller.postsList[i].body!,
                                // controller.isExpanded.value
                                //     ? controller.postsList[i].body!
                                //     : controller.postsList[i].body!
                                //         .substring(0, 3),
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

                                isOwner: controller.postsList[i].seekerid ==
                                    controller.idUserPostOwner,
                              );
                            },
                          ),
                        ],
                      ),
                      Positioned(
                        top: 110,
                        left: 10,
                        child: Visibility(
                          visible: sidebarcontroller.isShow.value,
                          child: SizedBox(
                            height: 560,
                            child: CustomSidebarX(
                                controller: sidebarcontroller.sidebarXController,
                                
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
