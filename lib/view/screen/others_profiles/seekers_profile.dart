import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/follow/follow_controller.dart';
import 'package:jobs/controller/profile/seeker_profile_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/screen/others_profiles/companies_profile.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/job_card_home.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/post_widget.dart';
import 'package:jobs/view/widget/others_profile/custom_info.dart';
import 'package:jobs/view/widget/others_profile/custom_info_list.dart';
import 'package:jobs/view/widget/others_profile/custom_profile_image.dart';
import 'package:jobs/view/widget/others_profile/custom_show_follow_button.dart';
import 'package:jobs/view/widget/others_profile/custom_title.dart';
import 'package:jobs/view/widget/others_profile/icon_back.dart';
import 'package:jobs/view/widget/others_profile/profile_bottom_navigation_bar.dart';

import '../../../controller/seeker/post/create_post_controller.dart';

class SeekerProfiles extends StatelessWidget {
  SeekerProfiles({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SeekerProfileControllerImp());
    final postController = Get.put(CreatePostControllerImp());

    Get.put(FollowControllerImp(idUser: controller.seekerModel.id!));
    return GetBuilder<SeekerProfileControllerImp>(
        builder: (controller) => GetBuilder<FollowControllerImp>(
            builder: (followController) => Scaffold(
                  backgroundColor: AppColor.Backgroundcolor(),
                  bottomNavigationBar: controller.idUserOwner !=
                          controller.seekerModel.id!
                      ? ProfileBottomNavigationBar(
                          onPressed: () {
                            followController.FollowOrRemove(
                                controller.seekerModel.id!);
                          },
                          text:
                              followController.isFollow() ? "142".tr : "143".tr,
                        )
                      : null,
                  body: ListView(children: [
                    Stack(clipBehavior: Clip.none, children: [
                      BackGroundProfileImage(),
                      Positioned(
                        top: 15,
                        right: 20,
                        left: 20,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconBack(
                                onPressed: () {
                                  controller.Back();
                                },
                              ),
                              PopupMenuButton<String>(
                                color: AppColor.white,
                                iconColor: AppColor.white,
                                onSelected: (value) {
                                  switch (value) {
                                    case 'edit':
                                      print("jjjjjjjjjjjjjjjjjjjjjjj");
                                      controller
                                          .goToEditPage(controller.seekerModel);
                                      break;
                                    case 'delete':
                                      controller.goToDeleteAccountPage();
                                      break;
                                    case 'report':
                                      controller.reportUser(
                                          controller.seekerModel.id!);
                                      break;
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return controller.idUserOwner ==
                                          controller.seekerModel.id!
                                      ? <PopupMenuEntry<String>>[
                                          PopupMenuItem(
                                            value: 'edit',
                                            child: Text("151".tr),
                                          ),
                                          PopupMenuItem(
                                            value: 'delete',
                                            child: Text("152".tr),
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
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 65.0,
                        right: Get.width / 3.4,
                        left: Get.width / 3.4,
                        child: Column(
                          children: [
                            TitleText(
                              title:
                                  "${controller.seekerModel.first_name! + " " + controller.seekerModel.last_name!}",
                            ),
                            SizedBox(height: 16),
                            customImage(image: controller.seekerModel.image),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(height: 10),
                    HandlingDataView(
                      statusRequest: followController.statusRequest,
                      widget: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customShowFollowButton(
                                count: '${followController.followingsCount}',
                                onPressed: () =>
                                    followController.showFollowings(),
                                text: "144".tr,
                              ),
                              customShowFollowButton(
                                count: '${followController.followersCount}',
                                onPressed: () =>
                                    followController.showFollowers(),
                                text: "145".tr,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          buildInfo(
                            info: " ${controller.seekerModel.email!}",
                            icon: Icons.email_outlined,
                          ),
                          buildInfo(
                            info: controller.seekerModel.specialization!,
                            icon: Icons.work_outline,
                          ),
                          buildInfo(
                            info: controller.seekerModel.location!,
                            icon: Icons.location_on,
                          ),
                          buildInfo(
                            info: controller.seekerModel.gender!,
                            icon: Icons.person,
                          ),
                          buildInfo(
                            info: controller.seekerModel.birth_day!,
                            icon: Icons.calendar_today_outlined,
                          ),
                          (controller.seekerModel.skills != null)
                              ? buildInfoSection(
                                  title: "133".tr,
                                  infoList: controller.seekerModel.skills!,
                                  icon: Icons.star,
                                )
                              : SizedBox(),
                          (controller.seekerModel.certificates != null)
                              ? buildInfoSection(
                                  title: "154".tr,
                                  infoList:
                                      controller.seekerModel.certificates!,
                                  icon: Icons.school_outlined,
                                )
                              : SizedBox(),
                          buildInfo(
                            info: controller.seekerModel.about!,
                            icon: Icons.info_outline,
                          ),
                          TitleOpportunitiesHome(
                            title: "46".tr,
                            viewall: false,
                          ),
                          controller.posts.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.posts.length,
                                  itemBuilder: (context, i) {
                                    return CustomPostWidget(
                                      onPressedDownload: () async {
                                        //  await controller.download(
                                        // '${controller.postsList[i].file}',
                                        // 'apply_cv_${controller.postsList[i].id}.pdf');
                                      },
                                      isLoudingPdf: false,
                                      postmodel: controller.posts[i],
                                      onTapExpanded: () {},
                                      isExpanded: false,
                                      textviewmore: '',
                                      text: controller.posts[i].body!,
                                      onSelected: (value) {
                                        switch (value) {
                                          case 'edit':
                                            print("jjjjjjjjjjjjjjjjjjjjjjj");
                                            postController.goToEditPage(
                                                controller.posts[i]);
                                            break;
                                          case 'delete':
                                            postController.deletePost(
                                                controller.posts[i].id!);
                                            break;
                                          case 'report':
                                            controller.reportPost(
                                                controller.posts[i].id!);
                                            break;
                                        }
                                      },
                                      isOwner: controller.posts[i].user_id ==
                                          controller.idUserOwner,
                                    );
                                  },
                                )
                              : NoDataWidget(
                                  text1: "${"207".tr}",
                                  text2:
                                      "${"206".tr} : ${controller.seekerModel.first_name}  ${controller.seekerModel.last_name} ",
                                ),
                          buildInfo(
                            info:
                                "${"156".tr + " " + controller.seekerModel.created_at!.substring(0, 10)}",
                            icon: Icons.event_available,
                          ),
                        ],
                      ),
                    ),
                  ]),
                )));
  }
}

class BackGroundProfileImage extends StatelessWidget {
  const BackGroundProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: AppColor.praimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
    );
  }
}
