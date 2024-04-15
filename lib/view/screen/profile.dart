import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {
  final RxString userName = 'John Doe'.obs;
  final RxString userEmail = 'johndoe@example.com'.obs;
}

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

   ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Profile Page'),
      ),
      body: Container(
        padding:const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
                  'Name: ${controller.userName}',
                  style:const TextStyle(fontSize: 24),
                )),
           const SizedBox(height: 10),
            Obx(() => Text(
                  'Email: ${controller.userEmail}',
                  style: const TextStyle(fontSize: 20),
                )),
  
          ],
        ),
      ),
    );
  }
}
