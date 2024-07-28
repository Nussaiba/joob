import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';
import 'package:path_provider/path_provider.dart';

class FileData {
 late Crud crud;
  FileData(this.crud);
     downloadImage(String url) async {
       final response = await http.get(Uri.parse("${AppLink.serverimage}/${url}"));
       if (response.statusCode == 200) {
         final bytes = response.bodyBytes;
         final tempDir = await getTemporaryDirectory();
         final file = File('${tempDir.path}.jpg');
         await file.writeAsBytes(bytes);
         return file;
       } else {
         throw Exception('Failed to download image');
       }
     }
     
}
