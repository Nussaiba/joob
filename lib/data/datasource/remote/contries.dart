import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class CountriesData {
  Crud crud;
  CountriesData(this.crud);

  getAllConData() async {
    var response = await crud.getData("https://countriesnow.space/api/v0.1/countries");
   return response.fold ((l)=> 1 , (r)=> r);
  }
 
}
