import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/get_all_opportunity_posts.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/widget/custom_card_opportunity.dart';
import 'package:jobs/view/widget/post_widget.dart';
import '../../../widget/drawerOfappp.dart';

class CompanyHome extends StatelessWidget {
  const CompanyHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetPostsAndOpportunityControllerImp());
    return GetBuilder<GetPostsAndOpportunityControllerImp>(
        builder: (controller) => Scaffold(
           drawer: DrawerOfApp(),
              body: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget:
                      //  Container(
                      //   color: Colors.red,
                      //   child: ListView.builder(
                      //   //  scrollDirection: Axis.horizontal,
                      //   controller: controller.scrollController,
                      //     itemCount: controller.opportuntiesList.length,
                      //     itemBuilder: (context, index) {
                      //       print(
                      //           "${controller.opportuntiesList.length}llllllllllll");

                      //       return CardJob(
                      //         opportuntiyModel:
                      //             controller.opportuntiesList[index],
                      //         onPressed: () =>
                      //             controller.goToPageOpportunityDetails(
                      //                 controller.opportuntiesList[index]),
                      //       );
                      //       //  ListTile(
                      //       //   title: Text(controller.opportuntiesList[index].title!),
                      //       //   subtitle: Text(controller.opportuntiesList[index].id!),
                      //       // );
                      //     },
                      //   ),
                      //),

                      Container(
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.postsList.length,
                      itemBuilder: (context, index) {
                        return CustomPostWidget(
                          postmodel: controller.postsList[index],
                          onTapExpanded: controller.toggleExpanded,
                          isExpanded: controller.isExpanded.value,
                          textviewmore: controller.isExpanded.value
                              ? 'view less'
                              : 'view more',
                          text: controller.isExpanded.value
                              ? controller.postsList[index].body!
                              : controller.postsList[index].body!
                                  .substring(0, 3),
                          onSelected: (value) {
                            switch (value) {
                              case 'edit':
                                controller.editPost();
                                break;
                              case 'delete':
                                controller.deletePost();
                                break;
                              case 'report':
                                controller.reportPost();
                                break;
                            }
                          },
                          isOwner: controller.postsList[index].seekerid ==
                              controller.idUserPostOwner,
                        );
                      },
                    ),
                  )),
              floatingActionButton: controller.isFabVisible.value
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 55),
                      child: FloatingActionButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.addOpportunity);
                        },
                        child: const Icon(Icons.add),
                      ),
                    )
                  : const SizedBox(),
            ));
  }
}
