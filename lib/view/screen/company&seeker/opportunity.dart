import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company_seeker/opportunity_details_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/view/widget/company/add_opportunity/info_bottomsheet.dart';
import 'package:jobs/view/widget/company/add_opportunity/simple_list.dart';
import 'package:jobs/view/widget/general/custom_button.dart';
import 'package:jobs/view/widget/others_profile/icon_back.dart';

class OpportunityPage extends StatelessWidget {
  const OpportunityPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OpportunityDetailsControllerImp());
    return GetBuilder<OpportunityDetailsControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColor.Backgroundcolor(),
              bottomNavigationBar: controller.account != 'company'
                  ? SizedBox(
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            onPressed: () {
                              controller.chooseApplyWay(
                                  controller.opportuntiyModel.id!);
                            },
                            title: "96".tr,
                          ),
                          CustomButton(
                            onPressed: () {},
                            title: "97".tr,
                          ),
                        ],
                      ),
                    )
                  : null,
              body: ListView(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          color: AppColor.praimaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(30)),
                        ),
                      ),
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
                                    controller.back();
                                  },
                                ),

                                PopupMenuButton<String>(
                                  color: AppColor.white,
                                  iconColor: AppColor.white,
                                  onSelected: (value) {
                                    switch (value) {
                                      case 'edit':
                                        controller.goToEditPage(
                                            controller.opportuntiyModel);

                                        break;
                                      case 'delete':
                                        controller.deleteOpportunity(
                                            controller.opportuntiyModel.id!);
                                        break;
                                      case 'report':
                                        controller.report(
                                            controller.opportuntiyModel.id!);
                                        break;
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return controller.idUserOpportunityOwner ==
                                            controller.opportuntiyModel.user_id!
                                        ? <PopupMenuEntry<String>>[
                                            PopupMenuItem(
                                              value: 'edit',
                                              child: Text("66".tr),
                                            ),
                                            PopupMenuItem(
                                              value: 'delete',
                                              child: Text("172".tr),
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
                                // PopUpMenu(
                                //   isOwner: controller.idUserOpportunityOwner ==
                                //       controller.opportuntiyModel.user_id!,
                                //   onPressedEdit: () {
                                //     controller.goToEditPage(
                                //         controller.opportuntiyModel);
                                //   },
                                //   onPressedDelete: () {
                                //     controller.deleteOpportunity(
                                //         controller.opportuntiyModel.id!);
                                //   },
                                //   onPressedReport: () {
                                //     controller.report(
                                //         controller.opportuntiyModel.id!);
                                //   },
                                // ),
                              ],
                            ),
                          )),
                      Positioned(
                        top: 82.0,
                        right: Get.width / 3.1,
                        left: Get.width / 3.1,
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.praimaryColor3,
                              border:
                                  Border.all(color: Colors.white, width: 5.0)),
                          child: Hero(
                            tag: controller.opportuntiyModel.id!,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: controller.opportuntiyModel.image != null
                                    ? Image.network(
                                        "${AppLink.serverimage}/${controller.opportuntiyModel.image}",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        AppImageAsset.onBoardingImgOne,
                                        fit: BoxFit.fill,
                                      )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(controller.opportuntiyModel.title!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: AppColor.praimaryColor,
                              letterSpacing: 1.2,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            )),
                        Hero(
                          tag: controller.opportuntiyModel.location!,
                          child: Text(
                              '${"148".tr}  ${controller.opportuntiyModel.location!}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColor.TextColor())),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemDetailColumn(
                            icon: Icons.schedule,
                            info: "53".tr,
                            info2: controller.opportuntiyModel.jophours!,
                          ),
                          ItemDetailColumn(
                            icon: Icons.home_work,
                            info: "63".tr,
                            info2: controller.opportuntiyModel.workPlaceType!,
                          ),
                          ItemDetailColumn(
                            icon: Icons.work,
                            info: "61".tr,
                            info2: '${controller.opportuntiyModel.jopType}',
                          ),
                          ItemDetailColumn(
                            icon: Icons.home_work,
                            info: "55".tr,
                            info2: controller.opportuntiyModel.salary!,
                          ),
                        ],
                      )),
                  DetailColumn(
                    name: "51".tr,
                    description: " ${controller.opportuntiyModel.body!}",
                  ),
                  InfoRow(title: "59".tr, icon: Icons.lightbulb_outline),
                  CustomSimpleList(
                    list: controller.opportuntiyModel.skills!,
                  ),
                  InfoRow(title: "57".tr, icon: Icons.school),
                  CustomSimpleList(
                    list: controller.opportuntiyModel.qualifications!,
                  ),
                ],
              ),
            ));
  }
}

class DetailColumn extends StatelessWidget {
  final String name;
  final String description;
  const DetailColumn({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.TextColor())),
            ),
          ),
          Text(description,
              style: TextStyle(
                  color: AppColor.TextColor(), fontSize: 16, height: 1.5)),
        ],
      ),
    );
  }
}

class ItemDetailColumn extends StatelessWidget {
  final IconData icon;
  final String info;
  final String info2;
  const ItemDetailColumn({
    super.key,
    required this.icon,
    required this.info,
    required this.info2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.PraimaryColor(),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(icon, color: AppColor.White()),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(info,
              style:
                  TextStyle(fontSize: 12, height: 1, color: AppColor.Grey())),
          Text(
            info2,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColor.TextColor()),
          )
        ],
      ),
    );
  }
}
