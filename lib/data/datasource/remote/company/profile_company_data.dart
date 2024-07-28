import 'dart:io';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class CompanyProfileData {
  Crud crud;
  CompanyProfileData(this.crud);
  createPostdata(String name, String location, File? image, String about,
      String contactInfo, String domain) async {
    var response = await crud.postFileAndData(
        AppLink.createcompanyprofile,
        {
          "company_name": name,
          "location": location,
          "about": about,
          "contact_info": contactInfo,
          "domain" : domain
        },
        'logo', image);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  updatePostdata(
    String name,
    String location,
    File ?image,
    String about,
    String contactInfo,
     String domain
  ) async {
    var response = await crud.postFileAndData(
        AppLink.updatecompanyprofile,
        {
          "company_name": name,
          "location": location,
          "about": about,
          "contact_info": contactInfo,
           "domain" : domain
        },
        'logo', image);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
