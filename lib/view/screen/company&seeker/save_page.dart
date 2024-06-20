import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/saved_opportunity_controller.dart';
import 'package:jobs/view/widget/custom_card_opportunity.dart';

class JobSavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SavedController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Job Opportunities'),
      ),
      body: GetBuilder<SavedController>(builder: (jobController) {
        return ListView.builder(
          itemCount: jobController.opportuntiesList.length,
          itemBuilder: (context, index) {
            final isSaved = jobController
                .isSaved(jobController.opportuntiesList[index].id!);
            return CardJob(
              opportuntiyModel: jobController.opportuntiesList[index],
              onPressed: () {
                jobController.goToPageOpportunityDetails(
                    jobController.opportuntiesList[index]);
              },
              icon: isSaved ? Icons.bookmark : Icons.bookmark_border,
              onTapIcon: () async {
                await jobController.addOrRemoveToSavedOpportunity(
                    jobController.opportuntiesList[index].id!);
              },
            );
          },
        );
      }),
    );
  }
}
