import 'dart:convert';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobs/core/constants/color.dart';
import 'package:path_provider/path_provider.dart';

class A extends StatelessWidget {
  A({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
            color: AppColor.praimaryColor,
            child: const Text("CV"),
            onPressed: () async {
              print('11');
              await createCV().whenComplete(() => print('done'));
            }),
      ),
    );
  }
}

Future<void> createCV() async {
  var headers = {
    'Accept': 'application/pdf',
    'Authorization':
        'Bearer 167|KMuZNEr2GZsSWNWfa7dS4kukXe8zZr10jrPrfWSh6a779a76',
    'Content-Type': 'application/json'
  };
  var responsecv = await http
      .post(Uri.parse('http://192.168.17.152:8000/api/seeker/createCV'),
          body: json.encode({
            "full_name": "ABC Phonics",
            "birth_day": "1/1/2000",
            "location": "Syria",
            "about": "Full Stack Developer",
            "skills": ["C++", "Python", "Laravel", "React JS"],
            "certificates": ["IT", "BLA BLA", "Good Thing"],
            "languages": ["Arabic", "English"],
            "projects": ["Some Thing1", "Some Thing2"],
            "experiences": ["Laravel", "Good Exp"],
            "contacts": ["whatsapp: 0912345678", "telegram: myTelegram"],
            "profile": ["facebook: blabalbafas", "X: hi", "github: @myGithub"]
          }),
          headers: headers)
      .whenComplete(() => print("DONE"));
  ;
  print("11111111");
  print(responsecv.statusCode);
  if (responsecv.statusCode == 200) {
    print(responsecv.statusCode);
    final bytes = responsecv.bodyBytes;
    print(bytes);
    final buffer = bytes.buffer;
    print(buffer);
    //Directory appStore = await getApplicationDocumentsDirectory();
    //print(appStore.path);

    final appStore =
        await getExternalStorageDirectory().whenComplete(() => print('LLLL'));

    final docpath = appStore!.path;
    print(docpath);
    File fileCv = File('$docpath/cv.pdf');
    print(fileCv);

    await fileCv.writeAsBytes(buffer.asUint8List());
    print(fileCv);

    await OpenFile.open(fileCv.path).whenComplete(() => print("CV"));
  } else {
    print(responsecv.reasonPhrase);
    print(responsecv);
  }
}
