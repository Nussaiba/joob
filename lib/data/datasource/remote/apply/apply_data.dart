import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class AppliesData {
  Crud crud;
  AppliesData(this.crud);

  getAllAppliesCompany() async {
    var response = await crud.getData(AppLink.getAppliesCompany);
    return response.fold((l) => 1, (r) => r);
  }

  getMyAppliesSeeker() async {
    var response = await crud.getData(AppLink.getMyAppliesSeeker);
    return response.fold((l) => 1, (r) => r);
  }

  apply(int id) async {
    var response = await crud
        .postData("${AppLink.apply}/$id", {"...................": "................"});
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => 1, (r) => r);
  }

  updateApply(int id) async {
    var response = await crud.postData(
        "${AppLink.updateApply}/$id", {"...................": "................"});
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => 1, (r) => r);
  }

  deleteApply(int id) async {
    var response = await crud.deleteData("${AppLink.deleteApply}/$id");
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => 1, (r) => r);
  }

  updateStatusApply(int id, String status) async {
    var response = await crud
        .postData("${AppLink.updateStatusApply}/$id", {"status": status});
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => 1, (r) => r);
  }

}
