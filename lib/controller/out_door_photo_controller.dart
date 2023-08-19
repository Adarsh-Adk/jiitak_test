import 'package:get/get.dart';

import '../model/repository/profile_page_repo.dart';

class OutDoorPhotoController extends GetxController {
  List<String> _list = ProfilePageRepo.storeAppearance;

  List<String> get list => _list;

  remove(String value) {
    _list.remove(value);
    update();
  }

  add() {
    _list = [..._list, ...ProfilePageRepo.storeAppearance];
    update();
  }
}
