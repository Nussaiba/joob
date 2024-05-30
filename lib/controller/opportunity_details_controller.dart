// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:jobs/data/model/opportunity_model.dart';

abstract class OpportunityDetailsController extends GetxController {}

class OpportunityDetailsControllerImp extends OpportunityDetailsController {
  late OpportuntiyModel opportuntiyModel;
  initalData() {
    opportuntiyModel = Get.arguments['opportuntiyModel'];
  }

  void Back() {
    Get.back();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }
}
