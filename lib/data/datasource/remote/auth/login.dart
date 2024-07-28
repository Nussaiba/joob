import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class LoginData {
  Crud crud;
 LoginData(this.crud);

  postdata(String email , String password) async {
    var response = await crud.postData(AppLink.login, {
      "login": email,
      "password": password,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
