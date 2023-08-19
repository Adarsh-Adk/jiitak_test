import 'package:get/get.dart';

import '../model/repository/profile_page_repo.dart';

class MenuPhotoController extends GetxController {
  List<String> _list = ProfilePageRepo.menuPhotos;
  List<String> get list => _list;

  remove(String value) {
    _list.remove(value);
    update();
  }

  add() {
    _list = [...list, ...ProfilePageRepo.menuPhotos];
    update();
  }
}
