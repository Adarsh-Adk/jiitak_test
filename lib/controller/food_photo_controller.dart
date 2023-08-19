import 'package:get/get.dart';

import '../model/repository/profile_page_repo.dart';

class FoodPhotoController extends GetxController {
  List<String> _list = ProfilePageRepo.foodPhotos;
  List<String> get list => _list;

  remove(String value) {
    _list.remove(value);
    update();
  }

  add() {
    _list = [...list, ...ProfilePageRepo.foodPhotos];
    update();
  }
}
