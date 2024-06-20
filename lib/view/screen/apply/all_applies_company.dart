
import 'package:flutter/material.dart';

import 'package:get/get.dart';

enum JobApplicationStatus { pending, accepted, rejected }

extension JobApplicationStatusExtension on JobApplicationStatus {
  String get name => toString().split('.').last;
}

class JobOpportunity {
  String name, company, submissionDate;
  Rx<JobApplicationStatus> status;

  JobOpportunity({
    required this.name,
    required this.company,
    required this.submissionDate,
    required this.status,
  });
}

class JobApplicationController extends GetxController {
  var jobOpportunity = JobOpportunity(
    name: 'Software Developer Role',
    company: 'Tech Solutions Inc.',
    submissionDate: '20 June 2024',
    status: JobApplicationStatus.pending.obs,
  );
  
  void changeStatus(JobApplicationStatus newStatus) {
    jobOpportunity.status.value = newStatus;
  }
}

class JobApplicationCard extends StatelessWidget {
  final JobApplicationController controller = Get.put(JobApplicationController());

  JobApplicationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 5,
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                controller.jobOpportunity.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Company: ${controller.jobOpportunity.company}"),
              SizedBox(height: 8),
              Text("Submission Date: ${controller.jobOpportunity.submissionDate}"),
              SizedBox(height: 8),
              Obx(() => Text(
                    "Status: ${controller.jobOpportunity.status.value.name}",
                    style: TextStyle(
                      fontSize: 16,
                      color: controller.jobOpportunity.status.value == JobApplicationStatus.pending
                          ? Colors.orange
                          : controller.jobOpportunity.status.value == JobApplicationStatus.accepted
                              ? Colors.green
                              : Colors.red,
                    ),
                  )),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatusButton("Accept", JobApplicationStatus.accepted, Colors.green),
                  _buildStatusButton("Reject", JobApplicationStatus.rejected, Colors.red),
                ],
              ),

                 SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Assuming a dialog or another method to set the status
                  // Here, you can call a method to open a dialog for example:
                  // showDialog(...);
                  // For demonstration, we are just changing it to "accepted"
                  //controller.updateApplicationStatus("accepted");
                },
                child: Text('Update Status'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusButton(String title, JobApplicationStatus status, Color color) {
    return ElevatedButton(
      onPressed: () => controller.changeStatus(status),
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(title),
    );
  }
}
////////////////////////////////////////////

