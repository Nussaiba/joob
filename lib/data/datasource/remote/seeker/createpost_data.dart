import 'dart:io';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class PostData {
  Crud crud;
  PostData(this.crud);
  createPostdata(String body, File? file, String ?type) async {
    var response = await crud.postFileAndData(
        AppLink.createPost,
        {
          "body": body,
          "type" : type
        },
        'file',
        file);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  deletePost(int id) async {
    var response = await crud.deleteData("${AppLink.deletePost}/$id");
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  

  editPostdata(int id, String ?body, File? file, String ?type) async {
    var response = await crud.postFileAndData(
        "${AppLink.editPost}/$id",
        {
          "_method" : 'PUT',
          "body": body,
          "type" : type
        },
       file !=null? 'file' : null,
         file !=null? file : null);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
