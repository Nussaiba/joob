import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  // استخدام Get.put() لإنشاء الكونترولر وجعله متاحا في التطبيق
  final MyController controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AAAA'),
      ),
      body: ListView.builder(
        controller: controller.scrollController,
        itemCount: 100,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
      floatingActionButton: Obx(
        () => Visibility(
          visible: controller.isVisible.value,
          child: FloatingActionButton(
            onPressed: () {
              // الإجراء الذي سيتم تنفيذه عند الضغط على الزر
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  // إنشاء متغيرات داخل الكونترولر
  var isVisible = true.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    // إضافة المستمع لمتحكم التمرير
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        isVisible.value = false;
      } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        isVisible.value = true;
      }
    });
  }

  @override
  void onClose() {
    // تنظيف الموارد عندما لا يكون الكونترولر بحاجة إليها
    scrollController.dispose();
    super.onClose();
  }
}
