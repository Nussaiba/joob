

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  var isCvSubmission = false.obs;

  void submitByCV() {
    isCvSubmission.value = true;
    // إضافة الخطوات المطلوبة لتقديم السيرة الذاتية
  }

  void submitByForm() {
    isCvSubmission.value = false;
    // إضافة الخطوات المطلوبة لتقديم عن طريق ملء النموذج
  }
}


class ApplicationPage extends StatelessWidget {
  ApplicationPage({Key? key}) : super(key: key);

  final ApplicationController controller = Get.put(ApplicationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply for a Job"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                controller.submitByCV();
                //Get.to(() => CvSubmissionPage()); // أو استخدام نافذة Dialog
              },
              icon: Icon(Icons.upload_file),
              label: Text("Submit by CV"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                controller.submitByForm();
               // Get.to(() => FormSubmissionPage()); // نقل المستخدم إلى صفحة ملء النموذج
              },
              icon: Icon(Icons.text_fields),
              label: Text("Fill the Form"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
/////////////////

