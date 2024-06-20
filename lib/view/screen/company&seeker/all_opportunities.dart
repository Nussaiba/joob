import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/get_all_opportunity_posts_home.dart';
import 'package:jobs/controller/saved_opportunity_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/widget/custom_card_opportunity.dart';

class AllOpportunitiesPage extends StatelessWidget {
  AllOpportunitiesPage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(GetPostsAndOpportunityControllerImp());

    return GetBuilder<GetPostsAndOpportunityControllerImp>(
        builder: (controller) => Scaffold(
              key: scaffoldKey,
              backgroundColor: AppColor.grey.withOpacity(0.3),
              appBar: AppBar(
                  backgroundColor: AppColor.praimaryColor,
                  title: const Text('Opportunity',
                      style: TextStyle(color: AppColor.white))),
              body: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  color: Colors.red,
                  child: ListView.builder(
                    itemCount: controller.opportuntiesList.length,
                    itemBuilder: (context, index) {
                      return GetBuilder<SavedController>(
                          builder: (jobController) {
                        final isSaved = jobController
                            .isSaved(controller.opportuntiesList[index].id!);
                        return CardJob(
                          opportuntiyModel: controller.opportuntiesList[index],
                          onPressed: () =>
                              controller.goToPageOpportunityDetails(
                                  controller.opportuntiesList[index]),
                          icon:
                              isSaved ? Icons.bookmark : Icons.bookmark_border,
                          onTapIcon: () async {
                            await jobController.addOrRemoveToSavedOpportunity(
                                jobController.opportuntiesList[index].id!);
                          },
                        );
                      });
                    },
                  ),
                ),
              ),
              floatingActionButton: controller.isFabVisible.value &&
                      controller.account == 'company'
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
