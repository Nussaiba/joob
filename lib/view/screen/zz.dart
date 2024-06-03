// import 'package:flutter/material.dart';
// import 'package:jobs/core/constants/imageassest.dart';

// class ImageDropdown extends StatefulWidget {
//   @override
//   _ImageDropdownState createState() => _ImageDropdownState();
// }

// class _ImageDropdownState extends State<ImageDropdown> {
//   String? selectedValue;

//   List<Map> items = [
//     {
//       'value': 'option1',
//       'image': AppImageAsset.logo,
//       'text': 'الخيار الأول',
//     },
//     {
//       'value': 'option2',
//       'image': AppImageAsset.logo,
//       'text': 'الخيار الثاني',
//     },
//     // يمكنك إضافة المزيد من الخيارات هنا
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           DropdownButton<String>(
//             value: selectedValue,
//             hint: Text('اختر خيارًا'),
//             onChanged: (newValue) {
//               setState(() {
//                 selectedValue = newValue;
//               });
//             },
//             items: items.map((Map item) {
//               return DropdownMenuItem<String>(
//                 value: item['value'],
//                 child: Row(
//                   children: <Widget>[
//                     Image.asset(
//                       item['image'],
//                       width: 25,
//                       height: 25,
//                     ),
//                     const SizedBox(width: 10),
//                     Text(item['text']),
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
        
         
        
          
//         ],
//       ),
//     );
//   }
// }


import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/imageassest.dart';

class ImageDropdown extends StatelessWidget {
  const ImageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
      ),
       body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(const ProfileScreen11());
              },
              child: const Hero(
                tag: 'profile-picture',
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppImageAsset.onBoardingImgFour),
                  radius: 50.0,
                ),
              ),
            ),

            
AvatarGlow(


   glowColor  :Colors.grey,
 //  glowShape:BoxShape.circle,
 // BorderRadius? glowBorderRadius,
  duration :const Duration(seconds: 2),
  //startDelay: Duration(milliseconds: 2000),
  // animate : true,
   //repeat : true,
   //curve : Curves.fastOutSlowIn,
   //glowRadiusFactor : 0.7,
  //glowColor: Colors.grey,
 // startDelay: Duration(milliseconds: 2000),
  //endRadius: 90.0,
  //duration: Duration(milliseconds: 2000),
  //repeat: true,
  //showTwoGlows: true,
 // repeatPauseDuration: const Duration(milliseconds: 100),
  child: Material(
    // Replace this child with your own
    elevation: 8.0,
    shape: const CircleBorder(),
    child: CircleAvatar(
      backgroundColor: Colors.grey[100],
      radius: 40.0,
      child: Image.asset(AppImageAsset.onBoardingImgFour, height: 60),
    ),
  ),
)
          ],
        ),
      ),
    );
  }
}
class ProfileScreen11 extends StatelessWidget {
  const ProfileScreen11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
      ),
      body: const Center(
        child: Hero(
          tag: 'profile-picture',
          child: CircleAvatar(
            backgroundImage: AssetImage(AppImageAsset.onBoardingImgFour),
            radius: 100.0, // حجم أكبر للصورة في صفحة الملف الشخصي
          ),
        ),
      ),
    );
  }
}


