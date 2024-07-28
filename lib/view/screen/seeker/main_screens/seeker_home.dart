import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company_seeker/drawer_controller.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/controller/saved_jobs/saved_opportunity_controller.dart';
import 'package:jobs/controller/seeker/post/create_post_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/screen/company&seeker/drawer.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/app_bar_home.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/job_card_home.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/post_widget.dart';
import 'package:jobs/controller/company_seeker/get_user_controller.dart';

class SeekerHome extends StatelessWidget {
  SeekerHome({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(GetPostsAndOpportunityControllerImp());
    Get.put(SavedController());
    final reportController = Get.put(ReportController());
    final controllerDrawer = Get.put(CustomDrawerController());
    final postController = Get.put(CreatePostControllerImp());
    final profileController = Get.put(GetUserController());
    return GetBuilder<GetPostsAndOpportunityControllerImp>(
        builder: (controller) => Scaffold(
                       backgroundColor: AppColor.Backgroundcolor(),

              endDrawer: CustomDrawer(),
              key: _scaffoldKey,
              body: ListView(
                children: [
                  AppBarHome(
                    onPressedDrawer: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                      controllerDrawer.toggleDrawer();
                    },
                    onPressedSearch: () {
                      Get.toNamed(AppRoute.searchPage);
                    },
                    text: "43".tr,
                  ),
                  TitleOpportunitiesHome(
                    title: "45".tr,
                    onTapViewAll: () {
                      controller.goToPageAllOpportunities();
                    },
                                 viewall: true,

                  ),
                  SizedBox(
                      height: 195,
                      child:
                           HandlingDataView(
                              statusRequest: controller.statusRequestOpportunity,
                              widget:
                          ListView.builder(
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
                              onPressed: () {
                                controller.goToPageOpportunityDetails(
                                    controller.opportuntiesList[index]);
                              },
                              onTapGoToProfile: () {
                                profileController.getUser(controller
                                    .opportuntiesList[index].user_id!);
                              },
                              icon: isSaved
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              onTapIcon: () async {
                                await jobController
                                    .addOrRemoveToSavedOpportunity(
                                        controller.opportuntiesList[index].id!);
                              },
                            );
                          });
                        },
                      )),
                  ),
                  TitleOpportunitiesHome(
                    title: "46".tr,
                    onTapViewAll: () {
                      controller.goToPageAllPosts();
                    },
                                                     viewall: true,

                  ),
                      HandlingDataView(
                        statusRequest: controller.statusRequestPosts,
                        widget:

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.postsList.length,
                    itemBuilder: (context, i) {
                      return CustomPostWidget(
                        onTapGoToProfile: () {
                          profileController
                              .getUser(controller.postsList[i].user_id!);
                        },
                        onPressedDownload: () async {
                          await controller.download(
                              '${controller.postsList[i].file}',
                              'apply_cv_${controller.postsList[i].id}.pdf');
                        },
                        
                        isLoudingPdf: false,
                        postmodel: controller.postsList[i],
                        onTapExpanded: controller.toggleExpanded,
                        isExpanded: controller.isExpanded.value,
                        textviewmore: '',
                        text: controller.postsList[i].body!,
                        onSelected: (value) {
                          switch (value) {
                            case 'edit':
                              print("jjjjjjjjjjjjjjjjjjjjjjj");
                              postController
                                  .goToEditPage(controller.postsList[i]);
                              break;
                            case 'delete':
                              postController
                                  .deletePost(controller.postsList[i].id!);
                              break;
                            case 'report':
                              reportController
                                  .showReportSheetPost(controller.postsList[i].id!);
                              break;
                          }
                        },
                        // onPressedReport: ()async {
                        //   await reportController
                        //       .showReportSheetPost(controller.postsList[i].id!);
                        // },
                        // onPressedDelete: () async {
                        //   await postController
                        //       .deletePost(controller.postsList[i].id!);
                        // },
                        // onPressedEdit: () async{
                        //  await postController.goToEditPage(controller.postsList[i]);
                        // },
                        isOwner: controller.postsList[i].user_id ==
                            int.parse(controller.idUserPostOwner),
                      );
                    },
                      ),),
                ],
              ),
            ));
  }
}
