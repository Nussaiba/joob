import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/testcontroller.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Date'),
      ),
      body: Center(
        child: GetBuilder<ProfileController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  controller.birthday != null
                      ? 'تاريخ الميلاد: ${controller.birthday!.toString().split(' ')[0]}'
                      : 'اختر تاريخ الميلاد',
                  style:   const  TextStyle(fontSize: 20),
                ),
               const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => controller.pickBirthday(context),
                  child:const  Text('اختر تاريخ الميلاد'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
