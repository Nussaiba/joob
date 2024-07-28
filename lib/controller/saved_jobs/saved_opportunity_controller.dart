import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/seeker/saved_opportunity.dart';
import 'package:jobs/data/model/opportunity_model.dart';

class SavedController extends GetxController {
  SaveData savedata = SaveData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late String account;
  List dataSaved = [];
  List<OpportunityModel> opportuntiesList = [];
  List<int> savedJob = [];
  getSavedOpportunityData() async {
    dataSaved.clear();
    opportuntiesList.clear();
    savedJob.clear();
    statusRequest = StatusRequest.loading;
    var response = await savedata.getAllSavedData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        dataSaved.addAll(response['data']);
        print(
            "${dataSaved.length}lllllllmmmmmmmmmmممممنننننننننننننننننننننننننlllll");
        // dataSaved.isEmpty
        //     ? statusRequest = StatusRequest.failure
        //     : statusRequest = StatusRequest.none;
        print("lll ${dataSaved.length}");
        update();
        for (int i = 0; i < dataSaved.length; i++) {
          opportuntiesList.add(
            OpportunityModel.fromJson(dataSaved[i]),
          );
          print("llhhl ${dataSaved.length}");
          savedJob.add(dataSaved[i]['id']);
          print("llkkkkkkkkkl ${savedJob.length}");
          print("lll $savedJob");
          update();
        }

        update();
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar('Error', 'Failed to fetch saved opportunities');
      }
    }
  }

  goToPageOpportunityDetails(opportuntiyModel) {
    Get.toNamed(AppRoute.opportunityPage,
        arguments: {"opportuntiyModel": opportuntiyModel});
  }

  addOrRemoveToSavedOpportunity(int id) async {
    final isCurrentlySaved = savedJob.contains(id);
    if (isCurrentlySaved) {
      savedJob.remove(id);
      
    } else {
      savedJob.add(id);
    
    }
    update();
    var response = await savedata.addToSavedOrRemoveOppData(id);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] != 200) {
        if (isCurrentlySaved) {
          savedJob.add(id);
          //update();
        } else {
          savedJob.remove(id);
          // update();
        }
        Get.snackbar('Error', 'Failed to saved opportunities');
        update();
      } else {
        var update1 = Get.find<SavedController>();
        update1.getSavedOpportunityData();
        update();
        // account == 'company'
        //     ? {Get.find<MainScreenCompanyControllerImp>().onItemClick(3)}
        //     : Get.find<MainScreenControllerImp>().onItemClick(3);

      await Get.snackbar('Yes', response['message']);
      }
    }
  }

  @override
  void onInit() {
    getSavedOpportunityData();
    account = myServices.box.read("account");
    super.onInit();
  }

  bool isSaved(int id) {
    if (savedJob.contains(id)) {
      return true;
    } else {
      return false;
    }
  }
}
