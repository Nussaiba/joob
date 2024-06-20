import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/report_controller.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';

class ReportSheet extends StatelessWidget {
  final ReportController controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.currentPage.value) {
        case 0:
          return ReasonUserReportPage();
        case 1:
          return WhoPage();
        case 2:
          return NamePage();
        case 3:
          return AnotherReasonPage();
        case 4:
          return SendPeportPage();
        case 5:
          return ReasonPostReportPage();
        default:
          return Container();
      }
    });
  }
}

class ReasonUserReportPage extends StatelessWidget {
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
            title: const Text('Fake accounts'),
            onTap: () => controller.changePage(4),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text('Pretending to be someone'),
            onTap: () => controller.changePage(1),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text('Inappropriate profile image or user name'),
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

class WhoPage extends StatelessWidget {
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

class NamePage extends StatelessWidget {
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

class AnotherReasonPage extends StatelessWidget {
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

class SendPeportPage extends StatelessWidget {
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

class ReasonPostReportPage extends StatelessWidget {
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
            title: const Text('posting inappropriate things'),
            onTap: () => controller.changePage(3),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text('misleading news'),
            onTap: () => controller.changePage(3),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
