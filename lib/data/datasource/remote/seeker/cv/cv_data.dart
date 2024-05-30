import 'dart:convert';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class CvData {
  Crud crud;
  CvData(this.crud);

  postCvData( List skills , List certificates , List lunguages ,List projects , List experiences ,List contacts  ) async {
    var response = await crud.create(AppLink.createCV,  json.encode({
      "full_name": "ABC Phonics",
      "birth_day": "1/1/2000",
      "location": "Syria",
      "about": "Full Stack Developer",
      "skills": skills,
      "certificates":certificates,
      "languages": lunguages,
      "projects":projects,
      "experiences": experiences,
      "contacts": contacts,
      "profile": ["facebook: blabalbafas", "X: hi", "github: @myGithub"]
    })
    );
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => 1, (r) => r);
  }
}
