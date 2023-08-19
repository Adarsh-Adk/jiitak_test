import 'dart:developer';

import 'package:get/get.dart';

import '../model/entities/working_day.dart';
import '../model/repository/profile_page_repo.dart';

class BusinessDayController extends GetxController {
  List<WorkingDay> _list = ProfilePageRepo.workDays;
  List<WorkingDay> get totalList => _list;
  List<WorkingDay> _selectedDay = [];
  List<WorkingDay> get selectedDays => _selectedDay;

  toggle(WorkingDay day) {
    if (!_selectedDay.contains(day)) {
      _selectedDay.add(day);
    } else {
      _selectedDay.remove(day);
    }
    log("selectedDays are $selectedDays");
    update();
  }
}
