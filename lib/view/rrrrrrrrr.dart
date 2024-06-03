// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// //  واجهة  ReportButtonWidget  (غير متغيرة)
// class ReportButtonWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         Get.bottomSheet(ReportBottomSheet());
//       },
//       child: Text("الإبلاغ"),
//     );
//   }
// }

// //  واجهة  ReportBottomSheet  (تستخدم  GetBuilder)
// class ReportBottomSheet extends StatefulWidget {
//   @override
//   _ReportBottomSheetState createState() => _ReportBottomSheetState();
// }

// class _ReportBottomSheetState extends State<ReportBottomSheet> {
//   final _reportController = ReportController();

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ReportController>(
//       init: _reportController,
//       builder: (_) => Container(
//         height: 300, // ارتفاع BottomSheet
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // عنوان BottomSheet
//             Text("اختيار سبب الإبلاغ",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 16),
//             // محتوى BottomSheet
//             Expanded(
//               child: IndexedStack(
//                 index: _.currentStep,
//                 children: [
//                   _buildStep1(_reportController), // الواجهة الأولى
//                   _buildStep2(_reportController), // الواجهة الثانية
//                   _buildStep3(
//                     isFakeAccount: true,
//                     isInappropriateImage: false,
//                     isMe: false,
//                     isCompany: false,
//                     isFriend: false,
//                     isOther: false,
//                   ), // الواجهة الثالثة (لـ "Fake accounts")
//                   _buildStep3(
//                     isFakeAccount: false,
//                     isInappropriateImage: true,
//                     isMe: false,
//                     isCompany: false,
//                     isFriend: false,
//                     isOther: false,
//                   ), // الواجهة الثالثة (لـ "Inappropriate profile image")
//                   _buildStep3(
//                     isFakeAccount: false,
//                     isInappropriateImage: false,
//                     isMe: false,
//                     isCompany: false,
//                     isFriend: false,
//                     isOther: true,
//                   ), // الواجهة الثالثة (لـ "Another thing")
//                 ],
//               ),
//             ),
//             // زر الرجوع
//             ElevatedButton(
//               onPressed: _.currentStep > 0
//                   ? () {
//                       _.previousStep();
//                     }
//                   : null,
//               child: Text(_.currentStep > 0 ? "رجوع" : ""),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // الواجهة الأولى
//   Widget _buildStep1(ReportController controller) {
//     return ListView(
//       children: [
//         ReportOption(
//           title: "Pretending to be some one",
//           onTap: () {
//             controller.nextStep(1);
//           },
//         ),
//         ReportOption(
//           title: "Facke accounts",
//           onTap: () {
//             controller.nextStep(2); //  تحديد  _currentStep  بـ  2
//           },
//         ),
//         ReportOption(
//           title: "Inappropriate profile image",
//           onTap: () {
//             controller.nextStep(3); //  تحديد  _currentStep  بـ  3
//           },
//         ),
//         ReportOption(
//           title: "Another thing",
//           onTap: () {
//             controller.nextStep(4); //  تحديد  _currentStep  بـ  4
//           },
//         ),
//       ],
//     );
//   }

//   // الواجهة الثانية
//   Widget _buildStep2(ReportController controller) {
//     return ListView(
//       children: [
//         ReportOption(
//           title: "Me",
//           onTap: () {
//             controller.previousStep();
//             Get.to(() => ReportThirdScreen(
//                   isMe: true,
//                   isCompany: false,
//                   isFriend: false,
//                 ));
//           },
//         ),
//         ReportOption(
//           title: "A company",
//           onTap: () {
//             controller.previousStep();
//             Get.to(() => ReportThirdScreen(
//                   isCompany: true,
//                   isMe: false,
//                   isFriend: false,
//                 ));
//           },
//         ),
//         ReportOption(
//           title: "A friend",
//           onTap: () {
//             controller.previousStep();
//             Get.to(() => ReportThirdScreen(isFriend: true, isMe: false, isCompany: false,));
//           },
//         ),
//       ],
//     );
//   }

//   // الواجهة الثالثة
//   Widget _buildStep3({
//     required bool isFakeAccount,
//     required bool isInappropriateImage,
//     required bool isMe,
//     required bool isCompany,
//     required bool isFriend,
//     required bool isOther,
//   }) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (isFakeAccount || isInappropriateImage)
//             ElevatedButton(
//               onPressed: () {
//                 // إرسال الإبلاغ
//                 _reportController.previousStep();
//               },
//               child: Text("إرسال"),
//             ),
//           if (isMe || isCompany || isFriend)
//             Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: isMe
//                         ? "اسمك"
//                         : isCompany
//                             ? "اسم الشركة"
//                             : "اسم الصديق",
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     // إرسال الإبلاغ
//                     _reportController.previousStep();
//                   },
//                   child: Text("إرسال"),
//                 ),
//               ],
//             ),
//           if (isOther)
//             Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: "أدخل سبب الإبلاغ",
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     // إرسال الإبلاغ
//                     _reportController.previousStep();
//                   },
//                   child: Text("إرسال"),
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }

// //  واجهة  ReportOption  (غير متغيرة)
// class ReportOption extends StatelessWidget {
//   final String title;
//   final VoidCallback onTap;

//   ReportOption({required this.title, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(title),
//       onTap: onTap,
//     );
//   }
// }

// //  واجهة  ReportThirdScreen  (غير متغيرة)
// class ReportThirdScreen extends StatelessWidget {
//   final bool isMe;
//   final bool isCompany;
//   final bool isFriend;

//   ReportThirdScreen({
//     required this.isMe,
//     required this.isCompany,
//     required this.isFriend,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("إرسال الإبلاغ"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (isMe || isCompany || isFriend)
//               Column(
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: isMe
//                           ? "اسمك"
//                           : isCompany
//                               ? "اسم الشركة"
//                               : "اسم الصديق",
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       // إرسال الإبلاغ
//                       Get.back(); //  الرجوع للواجهة السابقة
//                     },
//                     child: Text("إرسال"),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //  فئة  ReportController  لتحكم في  _currentStep
// class ReportController extends GetxController {
//   var currentStep = 0;

//   void nextStep(int step) {
//     currentStep = step;
//     update();
//   }

//   void previousStep() {
//     currentStep--;
//     update();
//   }
// }

// //  واجهة  HomeScreen  (غير متغيرة)
// class ReportHomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       body: Center(
//         child: ReportButtonWidget(), // زر الإبلاغ
//       ),
//     );
//   }
// }
