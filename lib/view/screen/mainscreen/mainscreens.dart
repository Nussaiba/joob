import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/mainscreens/mainscreen.dart';
import 'package:jobs/view/widget/mainscreen/mainscreen/bottom_appbar.dart';
import 'package:jobs/view/widget/mainscreen/mainscreen/customclipper_bottom_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController());

    return Scaffold(
        body: GetBuilder<NavigationController>(
            builder: (controller) => IndexedStack(
                  index: controller.tabIndex.value,
                  children:  [
                    HomeScreen(),
                    SettingsScreen(),
                    HomeScreen1(),
                    SettingsScreen1(),
                  ],
                )),
        bottomNavigationBar: ClipPath(
          clipper: MyCustomClipper(),
          child: const CustomBottomAppBar(),
        ));
  }
}

//final ImagePickerController imagePickerController = Get.put(ImagePickerController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const  Center(
     // appBar: AppBar(title: Text('Pick Image Example')),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Obx(() => imagePickerController.selectedImagePath.value != ''
      //           ? Image.file(File(imagePickerController.selectedImagePath.value))
      //           : Text('No image selected')),
      //       ElevatedButton(
      //         onPressed: () {
      //           imagePickerController.pickImage();
      //         },
      //         child: Text('Pick Image from Gallery'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

// class ImagePickerController extends GetxController {
//   var selectedImagePath = ''.obs;

//   void pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       selectedImagePath.value = pickedFile.path;
//     } else {
//       Get.snackbar('Error', 'No Image Selected');
//     }
//   }
// }

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    return const  Center(child: Text('Home Screen11'));
  }
}

class SettingsScreen1 extends StatelessWidget {
  const SettingsScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    return const  Center(child: Text('Settings Screen1'));
  }
}
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const  Center(child: Text('Settings Screen1'));
  }
}
