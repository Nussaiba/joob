import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/opportunity_details_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/general/custom_button.dart';

class OpportunityPage extends StatelessWidget {
  const OpportunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OpportunityDetailsControllerImp());
    return GetBuilder<OpportunityDetailsControllerImp>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: SizedBox(
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OpportunityButton(
                      onPressed: () {},
                      title: 'Apply Job',
                    ),
                    OpportunityButton(
                      onPressed: () {},
                      title: 'Message',
                    ),
                  ],
                ),
              ),
              body: ListView(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: AppColor.praimaryColor,
                          //            gradient: LinearGradient(
                          //   colors: [AppColor.praimaryColor, Colors.grey.shade400],
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          // ),

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
                                IconButton(
                                  onPressed: () {
                                    controller.Back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_sharp,
                                    color: AppColor.white,
                                    size: 28,
                                  ),
                                ),
                                const Icon(
                                  Icons.bookmark_border,
                                  color: AppColor.white,
                                  size: 28,
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                        top: 80.0,
                        right: Get.width / 3.3,
                        left: Get.width / 3.3,
                        child: Container(
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: 5.0)),
                            child: CircleAvatar(
                             radius: 50,
                             backgroundImage: NetworkImage(
                              
                                 "${AppLink.serverimage}/${controller.opportuntiyModel.image}"),
                           )

                            //  ClipRRect(
                            //     borderRadius: BorderRadius.circular(100.0),
                            //     child: Hero(
                            //       tag: "${"controller.opportuntiyModel.image"}",
                            //       child: Image.asset(
                            //         AppImageAsset.onBoardingImgOne,
                            //         // width: 100,
                            //         // height: 100,
                            //         fit: BoxFit.fill,
                            //       ),
                            //  )),
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
                        Hero(
                          tag: controller.opportuntiyModel.id!,
                          child: Text(controller.opportuntiyModel.title!,
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
                        ),
                        Hero(
                          tag: controller.opportuntiyModel.location!,
                          child: Text(
                              'Location  ${controller.opportuntiyModel.location!}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColor.grey,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  // Divider(
                  //   height: 22,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ItemDetailColumn(
                        icon: Icons.schedule,
                        info: 'job Hours',
                        info2: controller.opportuntiyModel.jophours!,
                      ),
                      ItemDetailColumn(
                        icon: Icons.home_work,
                        info: 'Work Place Type',
                        info2: controller.opportuntiyModel.workPlaceType!,
                      ),
                      ItemDetailColumn(
                        icon: Icons.work,
                        info: 'Job Type',
                        info2: '${controller.opportuntiyModel.jopType}',
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ItemInContainer(
                          text: " ${controller.opportuntiyModel.salary}" r"$ ",
                        ),
                        ItemInContainer(
                          text: " ${controller.opportuntiyModel.vacant}",
                        ),
                      ],
                    ),
                  ),

                  DetailColumn(
                    name: 'Job  description',
                    description: " ${controller.opportuntiyModel.body!}",
                  ),

                  DetailColumn(
                    name: 'Qualifications',
                    description:
                        " ${controller.opportuntiyModel.qualifications!}",
                  ),
                  DetailColumn(
                    name: 'Skills',
                    description: " ${controller.opportuntiyModel.skills!}",
                  )
                ],
              ),
            ));
  }
}

class ItemInContainer extends StatelessWidget {
  final String text;
  const ItemInContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColor.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          )),
    );
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColor.black,
                )),
          ),
          Text(description,
              style: const TextStyle(
                  fontSize: 16, color: AppColor.grey, height: 1.5)),
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
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColor.praimaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(icon, color: AppColor.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(info,
            style:
                const TextStyle(fontSize: 12, color: AppColor.grey, height: 1)),
        Text(info2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColor.black,
            ))
      ],
    );
  }
}
