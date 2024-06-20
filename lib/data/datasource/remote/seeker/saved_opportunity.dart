import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class SaveData {
  Crud crud;
 SaveData(this.crud);

  getAllSavedData() async {
    var response = await crud.getData(AppLink.getSavedOpportunity);
   return response.fold ((l)=> 1 , (r)=> r);
  }


   addToSavedOrRemoveOppData(int id) async {
    var response = await crud.getData("${AppLink.saveOpportunity}/$id");
   return response.fold ((l)=> 1 , (r)=> r);
  }
}
