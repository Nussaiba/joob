//دوران عند الحفظ
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveIconController extends GetxController with GetSingleTickerProviderStateMixin {
  AnimationController? rotationController;

  @override
  void onInit() {
    super.onInit();
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void rotateIcon() {
    rotationController!.forward(from: 0 );
  }

  @override
  void onClose() {
    rotationController!.dispose();
    super.onClose();
  }
}


class SaveOpportunityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SaveIconController controller = Get.put(SaveIconController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Opportunity Card'),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: IconButton(
                  icon: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(controller.rotationController!),
                    child: Icon(Icons.save),
                  ),
                  onPressed: () {
                    controller.rotateIcon();
                  },
                ),
                title: Text('Title of Opportunity'),
                subtitle: Text('Description here...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////
///
///



class SaveIconAnimationController extends GetxController with SingleGetTickerProviderMixin {
  AnimationController? animController;
  Animation<double>? rotateAnimation;
 // Animation<Color>? colorAnimation;
Animation<Color?>? colorAnimation;

  @override
  void onInit() {
    super.onInit();
    
animController = AnimationController(
    duration: Duration(microseconds: 2), 
    vsync: this,
  );

  rotateAnimation = Tween<double>(begin: 0, end: 0.5).animate(animController!)
    ..addListener(() {
      update(); // لتحديث الUI مع الدوران
    });

  colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red).animate(animController!);

  animController!.addStatusListener((status) {
    if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
      animController!.reverse();
    }
    update(); // لتحديث الUI مع التغيير في اللون
  });

    animController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animController!.reverse();
      }
    });
  }

  void animateIcon() {
    if (animController!.status == AnimationStatus.dismissed) {
      animController!.forward();
    }
  }

  @override
  void onClose() {
    animController!.dispose();
    super.onClose();
  }
}



class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SaveIconAnimationController());

    return Scaffold(
      appBar: AppBar(title: Text('Save Icon Animation')),
      body: Center(
        child: GetBuilder<SaveIconAnimationController>( // استخدم GetBuilder لبناء الواجهة
          builder: (controller) => IconButton(
                icon: Transform.rotate(
                  angle: controller.rotateAnimation!.value * 4, // دوران قليل لليمين واليسار
                  child: Icon(Icons.save, 
                  //color: controller.colorAnimation.value
                ),
                ),
                onPressed: () {
                  controller.animateIcon();
                },
              ),
        ),
      ),
    );
  }
}



////////////////////////////////////////////
///
///



class OpportunitiesController extends GetxController {
  final pageController = PageController(viewportFraction: 0.7, ).obs;

  @override
  void onClose() {
    pageController.value.dispose();
    super.onClose();
  }
}

class OpportunitiesPagea extends StatelessWidget {
  final OpportunitiesController controller = Get.put(OpportunitiesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => PageView.builder(
            controller: controller.pageController.value,
            itemCount: 10, // عدد الفرص
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: controller.pageController.value,
                builder: (context, child) {
                  double scale = 1.0;
                  if (controller.pageController.value.position.haveDimensions) {
                    scale = controller.pageController.value.page! - index;
                    scale = (1 - (scale.abs() * .25)).clamp(0.85, 1.0);
                  }

                  return Center(
                    child: Transform.scale(
                      scale: scale,
                      child: Card(
                        margin: EdgeInsets.all(8),
                        elevation: 10,
                        child: Container(
                          height: 200,
                          child: Center(
                            child: Text(
                              "فرصة ${index + 1}",
                              style: TextStyle(fontSize: 32, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
///

