import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/follow/follow_controller.dart';
import 'package:jobs/controller/profile/company_profile_controller.dart';
import 'package:jobs/controller/saved_jobs/saved_opportunity_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/screen/others_profiles/seekers_profile.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/job_card_home.dart';
import 'package:jobs/view/widget/others_profile/custom_info.dart';
import 'package:jobs/view/widget/others_profile/custom_profile_image.dart';
import 'package:jobs/view/widget/others_profile/custom_show_follow_button.dart';
import 'package:jobs/view/widget/others_profile/custom_title.dart';
import 'package:jobs/view/widget/others_profile/icon_back.dart';
import 'package:jobs/view/widget/others_profile/profile_bottom_navigation_bar.dart';

class ProfileCompanies extends StatelessWidget {
  ProfileCompanies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompanyProfileControllerImp());
    Get.put(FollowControllerImp(idUser: controller.companyModel.id!));
    return GetBuilder<FollowControllerImp>(
        builder: (followController) => Scaffold(
              backgroundColor: AppColor.Backgroundcolor(),
              bottomNavigationBar: controller.idUserOwner !=
                      controller.companyModel.id!
                  ? ProfileBottomNavigationBar(
                      onPressed: () {
                        followController.FollowOrRemove(
                            controller.companyModel.id!);
                      },
                      text: followController.isFollow() ? "142".tr : "143".tr,
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
                            // PopUpMenu(
                            //   isOwner: controller.idUserOwner ==
                            //       controller.companyModel.id!,
                            //   onPressedReport: () {
                            //     controller
                            //         .reportUser(controller.companyModel.id!);
                            //   },
                            // ),
                            PopupMenuButton<String>(
                              color: AppColor.white,
                              iconColor: AppColor.white,
                              onSelected: (value) {
                                switch (value) {
                                  case 'edit':
                                    controller.goToEditProfilePage(
                                        controller.companyModel);
                                    break;
                                  case 'delete':
                                    controller.goToDeleteAccountPage();
                                    break;
                                  case 'report':
                                    controller.reportUser(
                                        controller.companyModel.id!);
                                    break;
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return controller.idUserOwner ==
                                        controller.companyModel.id!
                                    ? <PopupMenuEntry<String>>[
                                        PopupMenuItem(
                                          value: 'edit',
                                          child: Text("83".tr,
                                              style: TextStyle(
                                                  color: AppColor.TextColor())),
                                        ),
                                        PopupMenuItem(
                                          value: 'delete',
                                          child: Text("152".tr,
                                              style: TextStyle(
                                                  color: AppColor.TextColor())),
                                        ),
                                      ]
                                    : <PopupMenuEntry<String>>[
                                        PopupMenuItem(
                                          value: 'report',
                                          child: Text("100".tr,
                                              style: TextStyle(
                                                  color: AppColor.TextColor())),
                                        ),
                                      ];
                              },
                            ),
                          ]),
                    ),
                  ),
                  Positioned(
                    top: 65.0,
                    right: Get.width / 3,
                    left: Get.width / 3,
                    child: Column(
                      children: [
                        TitleText(title: controller.companyModel.company_name!),
                        SizedBox(height: 16),
                        customImage(image: controller.companyModel.logo),
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
                            onPressed: () => followController.showFollowings(),
                            text: "144".tr,
                          ),
                          customShowFollowButton(
                            count: '${followController.followersCount}',
                            onPressed: () => followController.showFollowers(),
                            text: "145".tr,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      buildInfo(
                        info: " ${controller.companyModel.company_name}",
                        icon: Icons.business,
                      ),
                      buildInfo(
                        info: controller.companyModel.domain!,
                        icon: Icons.work_outline,
                      ),
                      buildInfo(
                        info: controller.companyModel.location!,
                        icon: Icons.location_on_outlined,
                      ),
                      buildInfo(
                        info: controller.companyModel.contact_info!,
                        icon: Icons.contact_phone,
                      ),
                      buildInfo(
                        info: controller.companyModel.about!,
                        icon: Icons.info_outline,
                      ),
                      TitleOpportunitiesHome(
                        title: "45".tr,
                        viewall: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 195,
                          child: controller.opportunities.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.opportunities.length,
                                  itemBuilder: (context, index) {
                                    return GetBuilder<SavedController>(
                                        builder: (jobController) {
                                      final isSaved = jobController.isSaved(
                                          controller.opportunities[index].id!);
                                      return JobCardHome(
                                        opportuntiyModel:
                                            controller.opportunities[index],
                                        icon: isSaved
                                            ? Icons.bookmark
                                            : Icons.bookmark_border,
                                        onTapIcon: () async {
                                          await jobController
                                              .addOrRemoveToSavedOpportunity(
                                                  controller
                                                      .opportunities[index]
                                                      .id!);
                                        },
                                      );
                                    });
                                  },
                                )
                              : NoDataWidget(
                                  text1: "${"205".tr}",
                                  text2:
                                      "${"206".tr} : ${controller.companyModel.company_name} ${"200".tr}",
                                ),
                        ),
                      ),
                      buildInfo(
                        info:
                            "${"156".tr + " " + controller.companyModel.created_at!.substring(0, 10)}",
                        icon: Icons.event_available,
                      ),
                    ],
                  ),
                ),
              ]),
            ));
  }
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(color: AppColor.grey, fontSize: 20),
        ),
        Text(
          text2,
          style: TextStyle(color: AppColor.grey, fontSize: 20),
        ),
      ],
    ));
  }
}
