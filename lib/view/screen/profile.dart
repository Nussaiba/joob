import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {
  // مثال على بيانات المستخدم
  final RxString userName = 'John Doe'.obs;
  final RxString userEmail = 'johndoe@example.com'.obs;
}

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
                  'Name: ${controller.userName}',
                  style: TextStyle(fontSize: 24),
                )),
            SizedBox(height: 10),
            Obx(() => Text(
                  'Email: ${controller.userEmail}',
                  style: TextStyle(fontSize: 20),
                )),
            // يمكنك إضافة المزيد من المعلومات والويدجتس هنا
          ],
        ),
      ),
    );
  }
}
