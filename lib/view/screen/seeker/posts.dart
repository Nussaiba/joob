
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';


class PostController extends GetxController {
 // var posts = <Post>[].obs;
  var has = true.obs;
  var isExpanded = false.obs;
  var postText =
      "bost Body:  lllllll lllllllllll  llllllllllllll lllll lllllllll llllllllllllllll lllllllllll lllllllllll llllllll llllllllll fffffffffff ffffff ffffffffffffff fffffffffff ffffffffflll ll "
          .obs;
  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  @override
  void onInit() {
    super.onInit();
    // هنا يمكنك تحميل البوستات من قاعدة البيانات أو الشبكة
  }

  void deletePost(int index) {
   // posts.removeAt(index);
  }
}

class PostWidget extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey.withOpacity(0.3),
      appBar: AppBar(
          backgroundColor: AppColor.praimaryColor,
          title: const Text('Posts', style: TextStyle(color: AppColor.white))),
      body:

          //  Obx(
          //   () =>
          ListView.builder(
        // itemCount: controller.posts.length,
        itemCount: 12,
        itemBuilder: (context, index) {
          //  final post = controller.posts[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage(AppImageAsset.onBoardingImgThree),
                  ),
                  title: const Text("person name"),
                  subtitle:
                      const Text("2 year ago", style: TextStyle(height: 0.5)),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'delete') {
                        // controller.deletePost(index);
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Delete'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice.toLowerCase(),
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ),
               const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "post Title ...",
                    style:  TextStyle(
                        fontSize: 20.0,
                        color: AppColor.grey,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Obx(
                    () => RichText(
                      //  crossAxisAlignment:  CrossAxisAlignment.start,
                      //children: [
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.grey, height: 1.5),
                          children: [
                            TextSpan(
                              text: controller.isExpanded.value
                                  ? controller.postText.value
                                  : '${controller.postText.value.substring(0, 50)}  ...',
                            ),
                            TextSpan(
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.grey),
                              text: controller.isExpanded.value
                                  ? 'عرض أقل'
                                  : 'عرض المزيد',
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.toggleExpanded,
                            ),
                          ]),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),

                  // symmetric(horizontal: 10, vertical: 4),
                  child: controller.has.value
                      ? Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                  AppImageAsset.onBoardingImgFour,
                                  width: Get.width,
                                  fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: AppColor.grey,
                                child: IconButton(
                                  icon: const Icon(Icons.bookmark_border),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),

                              ),
                            ),
                          ],
                        )
                      : null,
                ),
              ],
            ),
          );
        },
      ),
      // ),
    );
  }
}
