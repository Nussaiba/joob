// // // // // // import 'package:get/get.dart';

// // // // // // import 'package:flutter/material.dart';

// // // // // // class ReportController extends GetxController {
// // // // // //   var selectedReason = ''.obs;
// // // // // //   var showAdditionalField = false.obs;

// // // // // //   void selectReason(String reason) {
// // // // // //     selectedReason.value = reason;
// // // // // //     showAdditionalField.value = (reason == 'another reason');
// // // // // //     update();
// // // // // //   }

// // // // // //   void sendReport() {
// // // // // //     // أرسل الإبلاغ هنا
// // // // // //   }
// // // // // // }

// // // // // // class ReportPage extends StatelessWidget {
// // // // // //   final ReportController controller = Get.put(ReportController());

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: const Text('Report User or Post'),
// // // // // //       ),
// // // // // //       body: Column(
// // // // // //         children: [
// // // // // //           ListTile(
// // // // // //             title: const Text('محاولة لانتحال شخصية ما'),
// // // // // //             onTap: () {
// // // // // //               Get.bottomSheet(
// // // // // //                 Wrap(
// // // // // //                   children: [
// // // // // //                     ListTile(
// // // // // //                       title: const Text('me'),
// // // // // //                       onTap: () {
// // // // // //                         controller.selectReason('me');
// // // // // //                         Get.back();
// // // // // //                       },
// // // // // //                     ),
// // // // // //                     ListTile(
// // // // // //                       title: const Text('a friend'),
// // // // // //                       onTap: () {
// // // // // //                         controller.selectReason('a friend');
// // // // // //                         // استدعاء تابع البحث هنا
// // // // // //                       },
// // // // // //                     ),
// // // // // //                     ListTile(
// // // // // //                       title: const Text('a company'),
// // // // // //                       onTap: () {
// // // // // //                         controller.selectReason('a company');
// // // // // //                         // استدعاء تابع البحث هنا
// // // // // //                       },
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               );
// // // // // //             },
// // // // // //           ),
// // // // // //           // ... الأسباب الأخرى ...
// // // // // //           ListTile(
// // // // // //             title: const Text('another reason'),
// // // // // //             onTap: () => controller.selectReason('another reason'),
// // // // // //           ),
// // // // // //           GetBuilder<ReportController>(
// // // // // //             builder: (_) {
// // // // // //               if (controller.showAdditionalField.value) {
// // // // // //                 return Padding(
// // // // // //                   padding: const EdgeInsets.all(8.0),
// // // // // //                   child: TextField(
// // // // // //                     decoration: const InputDecoration(
// // // // // //                       labelText: 'الرجاء كتابة السبب',
// // // // // //                       border: OutlineInputBorder(),
// // // // // //                     ),
// // // // // //                     onSubmitted: (value) {
// // // // // //                       // تعامل مع القيمة المدخلة
// // // // // //                     },
// // // // // //                   ),
// // // // // //                 );
// // // // // //               }
// // // // // //               return const SizedBox.shrink();
// // // // // //             },
// // // // // //           ),
// // // // // //           ElevatedButton(
// // // // // //             onPressed: () {
// // // // // //               if (controller.selectedReason.value == 'me') {
// // // // // //                 controller.sendReport();
// // // // // //               }
// // // // // //               // لإضافة تفاعلات أخرى على أساس السبب المختار
// // // // // //             },
// // // // // //             child: const Text('Send'),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // // import 'package:get/get.dart';

// // // // // import 'package:flutter/material.dart';

// // // // // class ReportController extends GetxController {
// // // // //   var selectedReason = Rx<String?>(null);
// // // // //   var selectedSubReason = Rx<String?>(null);
// // // // //   var additionalInfo = ''.obs;

// // // // //   void setReason(String reason) {
// // // // //     selectedReason.value = reason;
// // // // //     selectedSubReason.value = null; // Reset subreason when main reason changes
// // // // //     update();
// // // // //   }

// // // // //   void setSubReason(String subReason) {
// // // // //     selectedSubReason.value = subReason;
// // // // //     update();
// // // // //   }

// // // // //   void setAdditionalInfo(String info) {
// // // // //     additionalInfo.value = info;
// // // // //   }

// // // // //   void submitReport() {
// // // // //     if (selectedReason.value != null) {
// // // // //       // هنا يمكنك إضافة منطق لإرسال البيانات إلى السيرفر أو قاعدة البيانات
// // // // //       print('Report submitted with reason: ${selectedReason.value}');
// // // // //       if (selectedSubReason.value != null) {
// // // // //         print('Subreason: ${selectedSubReason.value}');
// // // // //       }
// // // // //       if (additionalInfo.value.isNotEmpty) {
// // // // //         print('Additional info: ${additionalInfo.value}');
// // // // //       }
// // // // //       // Reset the report state after submission
// // // // //       selectedReason.value = null;
// // // // //       selectedSubReason.value = null;
// // // // //       additionalInfo.value = '';
// // // // //       update();
// // // // //     }
// // // // //   }
// // // // // }
// // // // // class ReportPage extends StatelessWidget {
// // // // //   final ReportController controller = Get.put(ReportController());

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: Text('Report Issue'),
// // // // //       ),
// // // // //       body: ListView(
// // // // //         children: [
// // // // //           ListTile(
// // // // //             title: Text('محاولة لانتحال شخصية ما'),
// // // // //             onTap: () => controller.setReason('impersonation'),
// // // // //           ),
// // // // //           ListTile(
// // // // //             title: Text('حساب مزيف'),
// // // // //             onTap: () => controller.setReason('fake_account'),
// // // // //           ),
// // // // //           ListTile(
// // // // //             title: Text('صورة الحساب أو البروفايل غير مناسبين'),
// // // // //             onTap: () => controller.setReason('inappropriate_picture'),
// // // // //           ),
// // // // //           ListTile(
// // // // //             title: Text('another reason'),
// // // // //             onTap: () => controller.setReason('other'),
// // // // //           ),
// // // // //           GetBuilder<ReportController>(
// // // // //             builder: (_) {
// // // // //               if (controller.selectedReason.value == 'impersonation') {
// // // // //                 return Column(
// // // // //                   children: [
// // // // //                     ListTile(
// // // // //                       title: Text('me'),
// // // // //                       onTap: () => controller.setSubReason('me'),
// // // // //                     ),
// // // // //                     ListTile(
// // // // //                       title: Text('a friend'),
// // // // //                       onTap: () => controller.setSubReason('friend'),
// // // // //                     ),
// // // // //                     ListTile(
// // // // //                       title: Text('a company'),
// // // // //                       onTap: () => controller.setSubReason('company'),
// // // // //                     ),
// // // // //                   ],
// // // // //                 );
// // // // //               } else if (controller.selectedReason.value == 'other') {
// // // // //                 return Padding(
// // // // //                   padding: const EdgeInsets.all(8.0),
// // // // //                   child: TextField(
// // // // //                     decoration: InputDecoration(
// // // // //                       labelText: 'Please provide more details',
// // // // //                       border: OutlineInputBorder(),
// // // // //                     ),
// // // // //                     onChanged: (value) => controller.setAdditionalInfo(value),
// // // // //                   ),
// // // // //                 );
// // // // //               }
// // // // //               return SizedBox.shrink();
// // // // //             },
// // // // //           ),
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // // // //             child: ElevatedButton(
// // // // //               onPressed: controller.submitReport,
// // // // //               child: Text('Submit Report'),
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';

// // // // class ReportController extends GetxController {
// // // //   var selectedReason = Rx<String?>(null);
// // // //   var selectedSubReason = Rx<String?>(null);
// // // //   var additionalInfo = ''.obs;
// // // //   var pageController = PageController();

// // // //   void setReason(String reason) {
// // // //     selectedReason.value = reason;
// // // //     pageController.nextPage(
// // // //       duration: const Duration(milliseconds: 300),
// // // //       curve: Curves.easeIn,
// // // //     );
// // // //   }

// // // //   void setSubReason(String subReason) {
// // // //     selectedSubReason.value = subReason;
// // // //     update();
// // // //   }

// // // //   void setAdditionalInfo(String info) {
// // // //     additionalInfo.value = info;
// // // //   }

// // // //   void submitReport() {
// // // //     // إرسال البيانات إلى السيرفر أو قاعدة البيانات
// // // //     // ...
// // // //     Get.back(); // إغلاق الصفحة بعد الإرسال
// // // //   }

// // // //   @override
// // // //   void onClose() {
// // // //     pageController.dispose(); // تنظيف الموارد عند إغلاق الكونترولر
// // // //     super.onClose();
// // // //   }
// // // // }

// // // // class ReportPage extends StatelessWidget {
// // // //   final ReportController controller = Get.put(ReportController());

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('Report Issue'),
// // // //       ),
// // // //       body: PageView(
// // // //         controller: controller.pageController,
// // // //         physics: const NeverScrollableScrollPhysics(), // منع التمرير اليدوي
// // // //         children: [
// // // //           buildInitialReportView(),
// // // //           buildImpersonationView(),
// // // //           buildAdditionalInfoView(),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget buildInitialReportView() {
// // // //     return ListView(
// // // //       children: [
// // // //         ListTile(
// // // //           leading: const Icon(Icons.person),
// // // //           title: const Text('محاولة لانتحال شخصية ما'),
// // // //           onTap: () => controller.setReason('impersonation'),
// // // //         ),
// // // //         ListTile(
// // // //           leading: const Icon(Icons.error),
// // // //           title: const Text('حساب مزيف'),
// // // //           onTap: () => controller.setReason('fake_account'),
// // // //         ),
// // // //         ListTile(
// // // //           leading:  const Icon(Icons.report_problem),
// // // //           title: const Text('صورة الحساب أو البروفايل غير مناسبين'),
// // // //           onTap: () => controller.setReason('inappropriate_picture'),
// // // //         ),
// // // //         ListTile(
// // // //           leading: const Icon(Icons.aother_houses),
// // // //           title: const Text('another reason'),
// // // //           onTap: () => controller.setReason('other'),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget buildImpersonationView() {
// // // //     return ListView(
// // // //       children: [
// // // //         ListTile(
// // // //           title: const Text('me'),
// // // //           onTap: () => controller.setSubReason('me'),
// // // //         ),
// // // //         ListTile(
// // // //           title: const Text('a friend'),
// // // //           onTap: () => controller.setSubReason('friend'),
// // // //         ),
// // // //         ListTile(
// // // //           title: const Text('a company'),
// // // //           onTap: () => controller.setSubReason('company'),
// // // //         ),
// // // //         ElevatedButton(
// // // //           onPressed: controller.submitReport,
// // // //           child: const Text('Submit Report'),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget buildAdditionalInfoView() {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.all(8.0),
// // // //       child: Column(
// // // //         children: [
// // // //           TextField(
// // // //             decoration: const InputDecoration(
// // // //               labelText: 'Please provide more details',
// // // //               border: OutlineInputBorder(),
// // // //             ),
// // // //             onChanged: (value) => controller.setAdditionalInfo(value),
// // // //           ),
// // // //           const SizedBox(height: 20),
// // // //           ElevatedButton(
// // // //             onPressed: controller.submitReport,
// // // //             child: const Text('Submit Report'),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';

// // // class ReportController extends GetxController {
// // //   var currentPage = 0.obs;

// // //   void nextPage() {
// // //     if (currentPage.value < 2) { // افترض أن لديك 3 صفحات
// // //       currentPage.value++;
// // //     }
// // //   }

// // //   void previousPage() {
// // //     if (currentPage.value > 0) {
// // //       currentPage.value--;
// // //     }
// // //   }

// // //   void reset() {
// // //     currentPage.value = 0;
// // //   }
// // // }

// // // class ReportPage extends StatelessWidget {
// // //   final ReportController controller = Get.put(ReportController());

// // //   void showReportSheet(BuildContext context) {
// // //     showModalBottomSheet(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return GetX<ReportController>(
// // //           builder: (controller) {
// // //             return IndexedStack(
// // //               index: controller.currentPage.value,
// // //               children: [
// // //                 buildReportReasonsPage(context),
// // //                 buildSubReasonsPage(context),
// // //                 buildAdditionalInfoPage(context),
// // //               ],
// // //             );
// // //           },
// // //         );
// // //       },
// // //     );
// // //   }

// // //   Widget buildReportReasonsPage(BuildContext context) {
// // //     return ListView(
// // //       children: [
// // //         ListTile(
// // //           title: Text('محاولة لانتحال شخصية ما'),
// // //           onTap: () => controller.nextPage(),
// // //         ),
// // //         ListTile(
// // //           title: Text('حساب مزيف'),
// // //           onTap: () => controller.nextPage(),
// // //         ),
// // //         // أضف المزيد من الأسباب حسب الحاجة
// // //       ],
// // //     );
// // //   }

// // //   Widget buildSubReasonsPage(BuildContext context) {
// // //     return ListView(
// // //       children: [
// // //         ListTile(
// // //           title: Text('me'),
// // //           onTap: () => controller.nextPage(),
// // //         ),
// // //         ListTile(
// // //           title: Text('a friend'),
// // //           onTap: () => controller.nextPage(),
// // //         ),
// // //         // أضف المزيد من الأسباب الفرعية حسب الحاجة
// // //       ],
// // //     );
// // //   }

// // //   Widget buildAdditionalInfoPage(BuildContext context) {
// // //     return Center(
// // //       child: ElevatedButton(
// // //         child: Text('Submit Report'),
// // //         onPressed: () {
// // //           // منطق إرسال الإبلاغ
// // //           Navigator.pop(context); // إغلاق الـ BottomSheet بعد الإرسال
// // //           controller.reset(); // إعادة تعيين الحالة
// // //         },
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Report Issue'),
// // //       ),
// // //       body: Center(
// // //         child: ElevatedButton(
// // //           onPressed: () => showReportSheet(context),
// // //           child: Text('Report'),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // class ReportController extends GetxController {
// //   var currentPage = 0.obs;

// //   void nextPage() => currentPage.value++;
// //   void previousPage() => currentPage.value > 0 ? currentPage.value-- : null;
// //   void reset() => currentPage.value = 0;
// // }

// // void showReportSheet(BuildContext context, ReportController controller) {
// //   showModalBottomSheet(
// //     context: context,
// //     isScrollControlled: true,
// //     builder: (BuildContext context) {
// //       return AnimatedContainer(
// //         duration: const Duration(milliseconds: 300),
// //         padding: MediaQuery.of(context).viewInsets,
// //         child: Wrap(
// //           children: [
// //             Obx(
// //               () => Column(
// //                 children: [
// //                   if (controller.currentPage.value > 0)
// //                     ListTile(
// //                       leading: const Icon(Icons.arrow_back),
// //                       title: const Text('Back'),
// //                       onTap: controller.previousPage,
// //                     ),
// //                   ...buildReportPages(context, controller),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       );
// //     },
// //   );
// // }

// // List<Widget> buildReportPages(
// //     BuildContext context, ReportController controller) {
// //   return [
// //     buildReportReasonsPage(controller),
// //     buildSubReasonsPage(controller),
// //     buildAdditionalInfoPage(controller),
// //   ];
// // }

// // Widget buildReportReasonsPage(ReportController controller) {
// //   return Visibility(
// //     visible: controller.currentPage.value == 0,
// //     child: Column(
// //       children: [
// //         ListTile(
// //           title: const Text('Pretending to be some one'),
// //           onTap: controller.nextPage,
// //         ),
// //         ListTile(
// //           title: const Text('Fake account'),
// //           onTap: controller.nextPage,
// //         ),
// //         ListTile(
// //           title: const Text('Inappropriate profile picture'),
// //           onTap: controller.nextPage,
// //         ),
// //         ListTile(
// //           title: const Text('another thing'),
// //           onTap: controller.nextPage,
// //         ),
// //       ],
// //     ),
// //     // Add more list tiles for other reasons
// //   );
// // }

// // Widget buildSubReasonsPage(ReportController controller) {
// //   return Visibility(
// //     visible: controller.currentPage.value == 1,
// //     child: ListTile(
// //       title: const Text('Promotes Terrorism'),
// //       onTap: controller.nextPage,
// //     ),
// //     // Add more list tiles for sub-reasons
// //   );
// // }

// // Widget buildAdditionalInfoPage(ReportController controller) {
// //   return Visibility(
// //     visible: controller.currentPage.value == 2,
// //     child: Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         children: [
// //           const TextField(
// //             decoration: InputDecoration(
// //               labelText: 'Additional Information',
// //               border: OutlineInputBorder(),
// //             ),
// //             maxLines: 3,
// //           ),
// //           const SizedBox(height: 20),
// //           ElevatedButton(
// //             onPressed: () {
// //               // Submit report logic
// //               //   Navigator.pop(context);
// //               Get.back();
// //               controller.reset();
// //             },
// //             child: const Text('Submit Report'),
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// // }

// // class ReportPage extends StatelessWidget {
// //   final ReportController controller = Get.put(ReportController());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Report Issue'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () => showReportSheet(context, controller),
// //           child: const Text('Report'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ReportController extends GetxController {
//   var currentPage = 0.obs;
//   var selectedReason = ''.obs;

//   void nextPage({required String reason}) {
//     selectedReason.value = reason;
//     currentPage.value++;
//   }

//   void previousPage() => currentPage.value > 0 ? currentPage.value-- : null;
//   void reset() {
//     currentPage.value = 0;
//     selectedReason.value = '';
//   }
// }

// void showReportSheet(BuildContext context, ReportController controller) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return AnimatedContainer(
//         duration: Duration(milliseconds: 300),
//         padding: MediaQuery.of(context).viewInsets,
//         child: Wrap(
//           children: [
//             Obx(() =>
//               Column(
//                 children: [
//                   if (controller.currentPage.value > 0)
//                     ListTile(
//                       leading: Icon(Icons.arrow_back),
//                       title: Text('Back'),
//                       onTap: controller.previousPage,
//                     ),
//                   ...buildReportPages(context, controller),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// List<Widget> buildReportPages(BuildContext context, ReportController controller) {
//   return [
//     buildReportReasonsPage(controller),
//     if (controller.selectedReason.value == 'Another thing')
//       buildCustomReasonPage(controller),
//     // Add more conditional pages based on selectedReason
//   ];
// }

// Widget buildReportReasonsPage(ReportController controller) {
//   return Visibility(
//     visible: controller.currentPage.value == 0,
//     child: Column(
//       children: [
//         ListTile(
//           title: Text('Pretending to be someone'),
//           onTap: () => controller.nextPage(reason: 'Pretending to be someone'),
//         ),
//         ListTile(
//           title: Text('Fake accounts'),
//           onTap: () => controller.nextPage(reason: 'Fake accounts'),
//         ),
//         ListTile(
//           title: Text('Inappropriate profile image'),
//           onTap: () => controller.nextPage(reason: 'Inappropriate profile image'),
//         ),
//         ListTile(
//           title: Text('Another thing'),
//           onTap: () => controller.nextPage(reason: 'Another thing'),
//         ),
//       ],
//     ),
//   );
// }

// Widget buildCustomReasonPage(ReportController controller) {
//   return Visibility(
//     visible: controller.currentPage.value == 1 && controller.selectedReason.value == 'Another thing',
//     child: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           TextField(
//             decoration: InputDecoration(
//               labelText: 'Please specify the reason',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 3,
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               // Submit report logic for 'Another thing'
//             //  Navigator.pop(context);
//             Get.bac
//               controller.reset();
//             },
//             child: Text('Submit Report'),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// class ReportPage extends StatelessWidget {
//   final ReportController controller = Get.put(ReportController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Report Issue'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => showReportSheet(context, controller),
//           child: Text('Report'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Report extends StatelessWidget {
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
            );
          },
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
    return Wrap(
      children: [
        ListTile(
          title: const Text('Pretending to be someone'),
          onTap: () => controller.nextPage(),
        ),
        ListTile(
          title: const Text('Fake accounts'),
          onTap: () => controller.resetPage(),
        ),
        ListTile(
          title: const Text('Inappropriate profile image'),
          onTap: () => controller.resetPage(),
        ),
        ListTile(
          title: const Text('Another thing'),
          onTap: () => controller.resetPage(),
        ),
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  final ReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => controller.resetPage(),
          ),
          title: const Text('Me'),
          onTap: () => controller.nextPage(),
        ),
        ListTile(
          title: const Text('A company'),
          onTap: () => controller.nextPage(),
        ),
        ListTile(
          title: const Text('A friend'),
          onTap: () => controller.nextPage(),
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
          const TextField(
            decoration: InputDecoration(
              labelText: 'اسم الشخص أو الشركة',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // هنا يمكنك إضافة الكود اللازم لإرسال الإبلاغ
              controller.resetPage(); // إعادة تعيين الصفحة بعد الإرسال
              Get.back(); // إغلاق BottomSheet
            },
            child: const Text('إرسال الإبلاغ'),
          ),
        ],
      ),
    );
  }
}
