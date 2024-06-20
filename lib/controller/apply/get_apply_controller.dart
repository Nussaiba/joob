import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/apply/apply_data.dart';
import 'package:jobs/data/model/aplly_company_model.dart';

abstract class GetApplyController extends GetxController {}

class GetApplyControllerImp extends GetApplyController {
  AppliesData appliesData = AppliesData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List dataMyAppliesSeeker = [];
  List dataAllAppliesCompany = [];

  List<ApplyModel> myAppliesSeeker = [];
  List<ApplyModel> allAppliesCompany = [];

  getMyAppliesSeeker() async {
    statusRequest = StatusRequest.loading;
    var response = await appliesData.getMyAppliesSeeker();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        dataMyAppliesSeeker.addAll(response['data']);

        // dataSaved.isEmpty
        //     ? statusRequest = StatusRequest.failure
        //     : statusRequest = StatusRequest.none;
        print("lll ${dataMyAppliesSeeker.length}");
        for (int i = 0; i < dataMyAppliesSeeker.length; i++) {
          myAppliesSeeker.add(
            ApplyModel.fromJson(dataMyAppliesSeeker[i]),
          );
        }

        update();
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar('Error', 'Failed to fetch applies');
      }
    }
  }

  getAllAppliesCompany() async {
    statusRequest = StatusRequest.loading;
    var response = await appliesData.getAllAppliesCompany();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        dataAllAppliesCompany.addAll(response['data']);
        // dataSaved.isEmpty
        //     ? statusRequest = StatusRequest.failure
        //     : statusRequest = StatusRequest.none;
        print("lll ${dataAllAppliesCompany.length}");
        for (int i = 0; i < dataAllAppliesCompany.length; i++) {
          allAppliesCompany.add(
            ApplyModel.fromJson(dataAllAppliesCompany[i]),
          );
        }
        update();
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar('Error', 'Failed to fetch  all applies');
      }
    }
  }

  @override
  void onInit() {
    getMyAppliesSeeker();
    getAllAppliesCompany();
    super.onInit();
  }

}