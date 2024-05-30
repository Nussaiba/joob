import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getAllOppData() async {
    var response = await crud.getData(AppLink.allOpportunities);
   return response.fold ((l)=> 1 , (r)=> r);
  }
  getAllPostsData() async {
    var response = await crud.getData(AppLink.viewPost);
   return response.fold ((l)=> 1 , (r)=> r);
  }
}
