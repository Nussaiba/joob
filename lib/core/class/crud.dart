import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'package:jobs/core/services/services.dart';
import 'dart:io';
import 'package:path/path.dart';

//String? token =   myServices.box.read("token");

class Crud {
  MyServices myServices = Get.find();
  Map<String, String> headers = {
    "Accept": "application/json",
  };
  Token() {
    String? token = myServices.box.read("token");
    print("$token qqqqqqqqqqqqqqq");
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<Either<StatusRequest, Map>> postData(String linkurl, data) async {
    try {
      //if (await checkInternet()) {
      print("sssssssssss");
      Token();
      var response = await http.post(
        Uri.parse(linkurl),
        headers: headers,
        body: data,
      );
      print(response.statusCode);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 401 ||
          response.statusCode == 400 ||
          response.statusCode == 422 ||
          response.statusCode == 500) {
        Map responsebody = jsonDecode(response.body);
        print("CRUUUUUUUUUUUUUUUUuuuuuuD $responsebody .....");

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
      // } else {
      //   print("StatusRequest.offlinefailure");
      //   return const Left(StatusRequest.offlinefailure);
      // }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    Token();
    // if (await checkInternet()) {
    var response = await http.get(Uri.parse(linkurl), headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);

      //print(responsebody);
      print('=======${response}');
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
    // } else {
    //   return const Left(StatusRequest.offlinefailure);
    // }
  }

  Future<Either<StatusRequest, Map>> postFileAndData(
      String linkUrl, Map data, String filename, File? file) async {
    Token();
    print("object");

    var request = http.MultipartRequest(
      'Post',
      Uri.parse(
        linkUrl,
      ),
    );
    request.headers.addAll(headers);
    if (file != null) {
      int fileLength = await file.length();
      var streamData = http.ByteStream(file.openRead());
      var multiFile = http.MultipartFile(filename, streamData, fileLength,
          filename: basename(file.path));
      request.files.add(multiFile);
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 401 ||
        response.statusCode == 400 ||
        response.statusCode == 422 ||
        response.statusCode == 500) {
      Map responsebody = jsonDecode(response.body);

      print("postMultiData1============ $responsebody");

      return Right(responsebody);
    } else {
      print("postMultiData1============ ${response.body}");

      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, dynamic>> create(String linkurl, data) async {
    try {
      //if (await checkInternet()) {
      print("sssssssssss");
      Token();
      headers['Content-Type'] = 'application/json';
      headers['Accept'] = 'application/pdf';

      var response = await http.post(
        Uri.parse(linkurl),
        headers: headers,
        body: data,
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        print("CRUUUUUUUUUUUUUUUUuuuuuuD $response.....");

        return Right(response);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
      // } else {
      //   print("StatusRequest.offlinefailure");
      //   return const Left(StatusRequest.offlinefailure);
      // }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }


  Future<Either<StatusRequest, Map>> deleteData(String linkUrl) async {
    try {
      Token();
      var response = await http.delete(
        Uri.parse(linkUrl),
        headers: headers,
      );
      print(response.statusCode);

      if (response.statusCode == 200||
          response.statusCode == 201||
          response.statusCode == 401||
          response.statusCode == 400||
          response.statusCode == 422 ||
          response.statusCode == 500) {
        Map responsebody = jsonDecode(response.body);
        print("CRUD DELETE $responsebody .....");

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
