import 'package:get/get.dart';

class SavedController extends GetxController {
  Map isSaved = {
    //key : id
    //value : 0,1
    
  };

  setSaved(id, val) {
    isSaved[id] = val;
    update();
  }
}
