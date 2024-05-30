import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/get_all_opportunity_posts.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/widget/custom_card_opportunity.dart';

class CompanyHome extends StatelessWidget {
  const CompanyHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetPostsAndOpportunityControllerImp());
    return GetBuilder<GetPostsAndOpportunityControllerImp>(
        builder: (controller) => Scaffold(
              body: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.opportuntiesList.length,
                  itemBuilder: (context, index) {
                    print("${controller.opportuntiesList.length}llllllllllll");

                    return CardJob(
                      opportuntiyModel: controller.opportuntiesList[index],
                      onPressed: () => controller.goToPageOpportunityDetails(
                          controller.opportuntiesList[index]),
                    );
                    //  ListTile(
                    //   title: Text(controller.opportuntiesList[index].title!),
                    //   subtitle: Text(controller.opportuntiesList[index].id!),
                    // );
                  },
                ),
              ),
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
