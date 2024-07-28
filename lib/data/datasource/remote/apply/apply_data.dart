import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AppliesData {
  Crud crud;
  AppliesData(this.crud);

  Future<File> getFile(String url, String fileName) async {
    String pdfurl = '${AppLink.serverimage}/$url';
      final response = await http.get(Uri.parse(pdfurl));
    final dir = await getExternalStorageDirectory();
    final file = File('${dir!.path}/$fileName');
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  getAllAppliesCompany() async {
    var response = await crud.getData(AppLink.getAppliesCompany);
    return response.fold((l) => l, (r) => r);
  }

  getMyAppliesSeeker() async {
    var response = await crud.getData(AppLink.getMyAppliesSeeker);
    return response.fold((l) => l, (r) => r);
  }

  applyCV(int id, File cv) async {
    var response =
        await crud.postFileAndData("${AppLink.apply}/$id", {}, 'cv', cv);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  applyForm(
      int id,
      String full_name,
      String birth_day,
      String location,
      String about,
      List<String> skills,
      List<String> certificates,
      List<String> languages,
      List<String> projects,
      List<String> experiences,
      List<String> contacts) async {
    var response = await crud.postData("${AppLink.apply}/$id", {
      "full_name": full_name,
      "birth_day": birth_day,
      "location": location,
      "about": about,
      "skills": skills,
      "certificates": certificates,
      "languages": languages,
      "projects": projects,
      "experiences": experiences,
      "contacts": contacts
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  updateApplyCV(int id, File cv) async {
    var response =
        await crud.postFileAndData("${AppLink.updateApply}/$id", {}, 'cv', cv);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  updateApplyForm(
      int id,
      String? full_name,
      String? birth_day,
      String? location,
      String? about,
      List<String>? skills,
      List<String>? certificates,
      List<String>? languages,
      List<String>? projects,
      List<String>? experiences,
      List<String>? contacts) async {
    var response = await crud.postData("${AppLink.updateApply}/$id", {
      "full_name": full_name,
      "birth_day": birth_day,
      "location": location,
      "about": about,
      "skills": skills,
      "certificates": certificates,
      "languages": languages,
      "projects": projects,
      "experiences": experiences,
      "contacts": contacts
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  deleteApply(int id) async {
    var response = await crud.deleteData("${AppLink.deleteApply}/$id");
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  updateStatusApply(int id, String status) async {
    var response = await crud
        .postData("${AppLink.updateStatusApply}/$id", {"status": status});
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
