import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:jobs/core/constants/color.dart';

class PostPage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              postController.submitPost();
              Get.snackbar('Success', 'Post submitted successfully!');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) => postController.updatePostText(value),
                decoration: const InputDecoration(
                  hintText: 'What\'s on your mind?',
                  //   border: OutlineInputBorder(),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(height: 20),
              Obx(() => postController.postImage.value != null
                  ? Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Image.file(postController.postImage.value!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: AppColor.grey,
                            child: IconButton(
                              icon:
                                  const Icon(Icons.delete, color: Colors.white),
                              onPressed: () =>
                                  postController.postImage.value = null,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      //height: 500,
                      decoration: BoxDecoration(
                        //color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // child:
                      //     Icon(Icons.image, size: 100, color: Colors.grey[600]),
                    )),
              const SizedBox(height: 20),
              //       ElevatedButton.icon(
              //         onPressed: () => postController.pickImage(),
              //         icon:const Icon(Icons.add_a_photo),
              //         label: const Text('Add Image'),
              //         style: ElevatedButton.styleFrom(
              //           foregroundColor: Colors.white,
              //           backgroundColor: Theme.of(context).colorScheme.secondary,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(30.0),
              //           ),
              //         ),
              //      ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postController.pickImage();
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

class PostController extends GetxController {
  var postText = ''.obs;
  var postImage = Rxn<File>();

  void updatePostText(String newText) {
    postText.value = newText;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      postImage.value = File(image.path);
    }
  }

  void submitPost() {
    // إضافة الكود لإرسال البوست والصورة إلى السيرفر أو قاعدة البيانات
    print('Post submitted: ${postText.value}');
  }
}


// import 'package:flutter/material.dart';

// class IconAnimationWidget extends StatefulWidget {
//   @override
//   _IconAnimationWidgetState createState() => _IconAnimationWidgetState();
// }

// class _IconAnimationWidgetState extends State<IconAnimationWidget> with SingleTickerProviderStateMixin {
//  late AnimationController _controller;
// late   Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _startAnimation() {
//     if (_controller.isCompleted) {
//       _controller.reverse();
//     } else {
//       _controller.forward();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GestureDetector(
//           onTap: _startAnimation,
//           child: AnimatedBuilder(
          
//             animation: _animation,
//             builder: (context,  child) {
//               return Transform.scale(
//                 scale: _animation.value * 0.5 + 1,  // The scale will vary from 1 to 1.5
//                 child: child,
//               );
//             },
//             child: Icon(Icons.favorite, color: Colors.red),
//           ),
//         ),
//       ),
//     );
//   }
// }







