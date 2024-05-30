// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:jobs/core/class/statusrequest.dart';
// import 'package:jobs/core/constants/color.dart';
// import 'package:jobs/core/constants/routes.dart';
// import 'package:jobs/core/functions/dialiog.dart';
// import 'package:jobs/core/functions/handlingdata.dart';
// import 'package:jobs/core/services/services.dart';
// import 'package:jobs/data/datasource/remote/company/profile_company/profile_data.dart';
// import 'package:jobs/data/datasource/remote/profile/profile.dart';

// abstract class UpdateProfileCompanyController extends GetxController {
//   updateProfile();
// }

// class UpdateProfileCompanyControllerImp extends UpdateProfileCompanyController {
//   GlobalKey<FormState> formstate = GlobalKey<FormState>();

//   late TextEditingController? namecompany;
//   late TextEditingController? location;
//   File? image;
//   late TextEditingController? contactinfo;
//   late TextEditingController? about;
//   MyServices myServices = Get.find();
//   String? name;
//   String? Location;
//   String? About;
//   String? contactInfo;
//   String? imagepath;
//   StatusRequest statusRequest = StatusRequest.none;
//   CompanyProfileData profileData = CompanyProfileData(Get.find());

//   final picker = ImagePicker();
//   @override
//   Future getImage() async {
//     final pickedfile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedfile != null) {
//       image = File(pickedfile.path);
//       print(image);
//       print(image!.path);
//       print(image!.path.split("/").last);
//       update();
//     } else {
//       print("no Image");
//     }
//   }

//   @override
//   updateProfile() async {
//     //if (formstate.currentState!.validate()) {
//     statusRequest = StatusRequest.loading;
//     update();
//     print("=111111111  Controller");
//     var response = await profileData.updatePostdata(
//       namecompany == null ? name! : namecompany!.text,
//       location == null ? Location! : location!.text,
//       image == null ? getImageSaved()! : image!,
//       about == null ? About! : about!.text,
//       contactinfo == null ? contactInfo! : contactinfo!.text,
//     );
//     print("================$response  Controller");
//     statusRequest = handlingData(response);
//     print(statusRequest);
//     print(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == 201) {
//         myServices.box.write(
//           "name",
//           namecompany == null ? name! : namecompany!.text,
//         );
//         myServices.box.write(
//           "location",
//           location == null ? Location! : location!.text,
//         );
//         myServices.box.write(
//           "imagepath",
//           image == null ? getImageSaved()!.path : image!.path,
//         );

//         myServices.box.write(
//           "about",
//           about == null ? About! : about!.text,
//         );

//   myServices.box.write(
//           "contactinfo",
//           contactinfo == null ? contactInfo! : contactinfo!.text,
//         );


//         getDialog("yes", "yesss");
//         Get.offNamed(AppRoute.profilePage);
//       }
//     }
//     update();

//     //  } else {}
//   }

//   File? getImageSaved() {
//     if (imagepath != null) {
//       return File(imagepath!);
//     }
//     return null;
//   }

//   DateTime? birthday1;

//   void pickBirthday(BuildContext context) async {
//     DateTime initialDate = birthday1 ?? DateTime.now();
//     DateTime firstDate = DateTime(1900);
//     DateTime lastDate = DateTime.now();

//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             primaryColor: AppColor.praimaryColor,
//             colorScheme: const ColorScheme.light(
//               primary: AppColor.praimaryColor,
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (pickedDate != null && pickedDate != birthday1) {
//       birthday1 = pickedDate;
//       update();
//     }
//   }

//   initialData() {
//     firstName = myServices.box.read("firstname");
//     lastName = myServices.box.read("lastname");
//     Birthday = myServices.box.read("birthday");
//     Location = myServices.box.read("location");
//     imagepath = myServices.box.read("imagepath");
//     Skills = myServices.box.read("skills");
//     Certificates = myServices.box.read("certificates");
//     About = myServices.box.read("about");
//   }

//   @override
//   void onInit() {
//     initialData();
//     firstname = TextEditingController();
//     lastname = TextEditingController();
//     location = TextEditingController();
//     skills = TextEditingController();
//     certificates = TextEditingController();
//     about = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     firstname!.dispose();
//     lastname!.dispose();
//     location!.dispose();
//     skills!.dispose();
//     certificates!.dispose();
//     about!.dispose();
//     super.dispose();
//   }

//   @override
//   void onClose() {
//     image!.delete();
//     super.onClose();
//   }
// }
