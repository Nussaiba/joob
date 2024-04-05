import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      //if (await checkInternet()) {
              print("sssssssssss");

        var response = await http.post(Uri.parse(linkurl), body: data, headers: {
          "Accept" : "application/json"
        });
       print(response.statusCode);

        if (response.statusCode == 200 ||
         response.statusCode == 201||
         response.statusCode == 401 ||
          response.statusCode == 400 ||
            response.statusCode == 422 ||
         response.statusCode==500) {
          Map responsebody = jsonDecode(response.body);
          print("CRUUUUUUUUUUUUUUUUD $responsebody .....");

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
}
