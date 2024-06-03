

import 'package:jobs/api_link.dart';

import '../../../../core/class/crud.dart';

class LogoutData {
  Crud crud;
  LogoutData(this.crud);

  Future<Map<String, dynamic>> logout() async {
    var response = await crud.getData(AppLink.logout);
    print("Response data: $response");

    // Check if the response is Either and handle the Left (error) side correctly
    return response.fold(
      (l) => {"status": "error", "message": "An error occurred"},
      (r) => r is Map<String, dynamic>
          ? r
          : {"status": "error", "message": "Invalid response format"},
    );
  }
}