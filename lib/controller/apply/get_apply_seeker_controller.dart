import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/apply/apply_data.dart';
import 'package:jobs/data/model/apply_seeker_model.dart';

abstract class GetApplySeekerController extends GetxController {}

class GetApplySeekerControllerImp extends GetApplySeekerController {
  AppliesData appliesData = AppliesData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List dataMyAppliesSeeker = [];
  List<ApplySeekerModel> myAppliesSeeker = [];

  getMyAppliesSeeker() async {
    dataMyAppliesSeeker.clear();
    myAppliesSeeker.clear();
    statusRequest = StatusRequest.loading;
    var response = await appliesData.getMyAppliesSeeker();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        dataMyAppliesSeeker.addAll(response['data']);

        print("lll ${dataMyAppliesSeeker.length}");
        for (int i = 0; i < dataMyAppliesSeeker.length; i++) {
          myAppliesSeeker.add(
            ApplySeekerModel.fromJson(dataMyAppliesSeeker[i]),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar('Error', 'Failed to fetch applies');
      }
    }
    update();
  }

  @override
  void onInit() {
    getMyAppliesSeeker();
    super.onInit();
  }
}
