import 'dart:io';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class PostData {
  Crud crud;
  PostData(this.crud);
  createPostdata(
       String body,
      File? file) async {
    var response = await crud.postFileAndData(
        AppLink.createPost,
        {
          "body": body,
        },
        'file',
        file);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => 1, (r) => r);
  }
}
