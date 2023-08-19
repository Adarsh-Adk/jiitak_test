import '../../core/values/app_assets.dart';
import '../entities/stamp.dart';

class StampScreenRepo {
  static List<Stamp> getData() {
    return _createList(DateTime(2021, 3, 11), 20);
  }

  static _createList(DateTime dateTime, int count) {
    List<Stamp> list = [];

    for (int i = 0; i < count; i++) {
      list.add(Stamp(
          dateTime: DateTime(dateTime.year, dateTime.month, i),
          description: "スタンプを獲得しました。",
          trailing: "1 個"));
    }
    return list.reversed.toList();
  }

  static List<String> getStars() {
    List<String> list = List.generate(15, (index) => AppAssets.starIcon);
    return list;
  }
}
