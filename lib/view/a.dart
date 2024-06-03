// import 'package:flutter/cupertino.dart';
// import 'package:lottie/lottie.dart';
// class Anim extends StatelessWidget {
//   const Anim({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Lottie.asset("assets/anim/1.json"),
//         Lottie.asset("assets/anim/2.json"),
//         Lottie.asset("assets/anim/3.json"),
//         Lottie.asset("assets/anim/4.json"),
//         Lottie.asset("assets/anim/5.json"),
//         Lottie.asset("assets/anim/6.json"),
//         Lottie.asset("assets/anim/7.json"),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';

class MyAppA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomSheet Navigation')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              ReportSheet(),
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              backgroundColor: Colors.white,
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: const Text('Report'),
        ),
      ),
    );
  }
}

class ReportController extends GetxController {
  var currentPage = 0.obs;
  void nextPage() => currentPage.value++;
  void resetPage() => currentPage.value = 0;
  void changePage(int index) {
    currentPage.value = index;
  }
}

class ReportSheet extends StatelessWidget {
  final ReportController controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.currentPage.value) {
        case 0:
          return FirstPage();
        case 1:
          return SecondPage();
        case 2:
          return ThirdPage();
        case 3:
          return FourthPage();
        case 4:
          return SendPage();
        default:
          return Container();
      }
    });
  }
}

class FirstPage extends StatelessWidget {
  final ReportController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
                child: CustomTextTitleAuth(
              text: 'Peport',
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 5,
            endIndent: 10,
            indent: 10,
          ),
          const Center(
              child: CustomTextBodyAuth(
            text:
                'Help us undersand the issue by selecting the most relevant reason below',
          )),
          ListTile(
            title: const Text('Pretending to be someone'),
            onTap: () => controller.changePage(1),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text('Fake accounts'),
            onTap: () => controller.changePage(4),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text('Inappropriate profile image'),
            onTap: () => controller.changePage(4),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text('Another thing'),
            onTap: () => controller.changePage(3),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final ReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => controller.changePage(0),
              ),
              const CustomTextTitleAuth(
                text: 'Peport',
              ),
              const SizedBox(width: 40)
            ],
          ),
        ),
        const Divider(
          height: 5,
          endIndent: 10,
          indent: 10,
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 24),
            child: Text(
                'Select if someone is impersonating you or someone you know'),
          ),
        ),
        ListTile(
          title: const Text('Me'),
          onTap: () => controller.changePage(4),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          title: const Text('A company'),
          onTap: () => controller.changePage(2),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          title: const Text('A friend'),
          onTap: () => controller.changePage(2),
          trailing: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}

class ThirdPage extends StatelessWidget {
  final ReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => controller.changePage(0),
                ),
                const CustomTextTitleAuth(
                  text: 'Peport',
                ),
                const SizedBox(width: 40)
              ],
            ),
          ),
          const Divider(
            height: 5,
            endIndent: 10,
            indent: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 24),
            child: Text(
                'Please provide the name of the frined or company being impersonaed '),
          ),

           const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              labelText: 'name of person or company',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // هنا يمكنك إضافة الكود اللازم لإرسال الإبلاغ
              controller.resetPage(); // إعادة تعيين الصفحة بعد الإرسال
              Get.back(); // إغلاق BottomSheet/ إغلاق BottomSheet
            },
            child: const Text('Send Report'),
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  final ReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => controller.changePage(0),
                ),
                const CustomTextTitleAuth(
                  text: 'Peport',
                ),
                const SizedBox(width: 40)
              ],
            ),
          ),
          const Divider(
            height: 5,
            endIndent: 10,
            indent: 10,
          ),
          const Center(
              child: CustomTextBodyAuth(
            text: 'Describe the issue in detail and press Send to report',
          )),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              labelText: 'another thing',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // هنا يمكنك إضافة الكود اللازم لإرسال الإبلاغ
              controller.resetPage();
              Get.back();
            },
            child: const Text('Send Report'),
          ),
        ],
      ),
    );
  }
}

class SendPage extends StatelessWidget {
  final ReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(20),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => controller.changePage(0),
                ),
                const CustomTextTitleAuth(
                  text: 'Peport',
                ),
                const SizedBox(width: 40)
              ],
            ),
          ),
          const Divider(
            height: 5,
            endIndent: 10,
            indent: 10,
          ),
          const Center(
              child: CustomTextBodyAuth(
            text: 'Press Send to help us take action on this issue',
          )),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // هنا يمكنك إضافة الكود اللازم لإرسال الإبلاغ
                  controller.resetPage(); // إعادة تعيين الصفحة بعد الإرسال
                  Get.back();
                },
                child: const Text('Send Report'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
