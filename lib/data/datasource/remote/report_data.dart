import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class ReportData {
  Crud crud;
  ReportData(this.crud);

  postData(int reason_id, String? another_reason) async {
    var response = await crud.postData(AppLink.report,
        {
        "reason_id": reason_id,
         "another_reason": another_reason,
         //"who" :who
         });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => 1, (r) => r);
  }
}
