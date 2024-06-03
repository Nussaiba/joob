import 'package:jobs/core/class/crud.dart';
import '../../../../api_link.dart';

class DeleteAccountData {
  Crud crud;
  DeleteAccountData(this.crud);

  Future<Map<String, dynamic>> deleteAccount() async {
    var response = await crud.deleteData(AppLink.deleteaccount);
    print("Response data: $response");

  
    return response.fold(
      (l) => {"status": "error", "message": "An error occurred"},
      (r) => r is Map<String, dynamic>
          ? r
          : {"status": "error", "message": "Invalid response format"},
    );
  }
}
