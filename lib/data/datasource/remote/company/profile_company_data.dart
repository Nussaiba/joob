import 'dart:io';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class CompanyProfileData {
  Crud crud;
  CompanyProfileData(this.crud);
  createPostdata(String name, String location, File image, String about,
      String contactInfo) async {
    var response = await crud.postFileAndData(
        AppLink.createcompanyprofile,
        {
          "company_name": name,
          "location": location,
          "about": about,
          "contact_info": contactInfo
        },
        'logo', image);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => 1, (r) => r);
  }

  updatePostdata(
    String name,
    String location,
    File image,
    String about,
    String contactInfo,
  ) async {
    var response = await crud.postFileAndData(
        AppLink.updatecompanyprofile,
        {
          "company_name": name,
          "location": location,
          "about": about,
          "contact_info": contactInfo
        },
        'logo', image);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => 1, (r) => r);
  }
}
