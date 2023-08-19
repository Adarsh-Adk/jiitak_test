import 'package:intl/intl.dart';

import '../../model/entities/custom_date.dart';

class CustomDateUtils {
  static DateTime today = DateTime(2022, 5, 26);

  static List<CustomDate> getNext7days() {
    final dayFormatter = DateFormat('d');
    final dayFormatter2 = DateFormat('EE', 'ja_JP');
    List<CustomDate> dates = [];

    for (int i = 0; i < 7; i++) {
      final date = today.add(Duration(days: i));
      dates.add(CustomDate(
          date: dayFormatter.format(date),
          label: dayFormatter2.format(date),
          dateTime: date));
    }
    return dates;
  }

  static String todayInString() {
    final dayFormat = DateFormat('yyyy年 M月 d日 (E)', 'ja_JP');
    return dayFormat.format(today);
  }

  static String jobDateToString(
      {required DateTime date,
      required DateTime startTime,
      required DateTime endTime}) {
    final dateFormat = DateFormat('M月 d日 (E)', "ja_JP");
    final timeFormat = DateFormat('HH:mm', "ja_JP");
    return "${dateFormat.format(date)} ${timeFormat.format(startTime)} ~ ${timeFormat.format(endTime)}";
  }
}
