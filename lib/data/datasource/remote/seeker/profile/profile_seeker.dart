import 'dart:io';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);

  createPostdata(
      String firstname,
      String lastname,
      String birthday,
      String location,
      File? image,
      List<String> skills,
      List<String> certificates,
      String specialization,
      String about,
      String gender
      ) async {
    var response = await crud.postFileAndData(
        AppLink.createprofile,
        {
          "first_name": firstname,
          "last_name": lastname,
          "birth_day": birthday,
          "location": location,
          "skills": skills,
          "certificates": certificates,
          "specialization" : specialization,
          "about": about,
          "gender" : gender
        },
         'image', image);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  updatePostdata(
      String firstname,
      String lastname,
      String birthday,
      String location,
      File? image,
      List<String> skills,
      List<String> certificates,
      String specialization,
      String about,
      String gender) async {
    var response = await crud.postFileAndData(
        AppLink.updateprofile,
        {
          "first_name": firstname,
          "last_name": lastname,
          "birth_day": birthday,
          "location": location,
          "skills": skills,
          "certificates": certificates,
          "specialization" : specialization,
          "about": about,
          "gender" : gender
        },
       'image', image);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
