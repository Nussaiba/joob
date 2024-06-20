import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppliesSeeker extends StatelessWidget {
  AppliesSeeker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          JobApplyCard(
            jobTitle: "Front-end Developer",
            companyName: "Tech Inc.",
            state: "California",
            applicationDate: "12/04/2023",
            status: "Waiting",
          ),
           JobApplyCard(
            jobTitle: "Front-end Developer",
            companyName: "Tech Inc.",
            state: "California",
            applicationDate: "12/04/2023",
            status: "Waiting",
          ), JobApplyCard(
            jobTitle: "Front-end Developer",
            companyName: "Tech Inc.",
            state: "California",
            applicationDate: "12/04/2023",
            status: "Waiting",
          ),
          JobApplyCard(
            jobTitle: "Front-end Developer",
            companyName: "Tech Inc.",
            state: "California",
            applicationDate: "12/04/2023",
            status: "Waiting",
          ),
        ],
      ),
    );
  }
}

class JobApplyCard extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String state;
  final String applicationDate;
  final String status;

  JobApplyCard({
    required this.jobTitle,
    required this.companyName,
    required this.state,
    required this.applicationDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: AppColor.grey,
      elevation: 5,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              jobTitle,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "$companyName - $state",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Apply Date: $applicationDate",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Status: $status",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _getStatusColor(status),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "waiting":
        return Colors.orange;
      case "accepted":
        return Colors.green;
      case "rejected":
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
