import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/utils/custom_date_utils.dart';

class HomeDateController extends GetxController {
  DateTime _dateTime = CustomDateUtils.today;
  DateTime get dateTime => _dateTime;

  setDate(DateTime dateTime) {
    _dateTime = dateTime;
    update();
  }

  String getDate() {
    final dayFormat = DateFormat('yyyy年 M月 d日 (E)', 'ja_JP');
    return dayFormat.format(_dateTime);
  }
}
