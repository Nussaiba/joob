import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyServices extends GetxService {
  final box = GetStorage();
  Future<MyServices> init() async {
   await GetStorage.init();
//box= GetStorage.init([String container = 'GetStorage']);
    return this;
  }
}



initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
