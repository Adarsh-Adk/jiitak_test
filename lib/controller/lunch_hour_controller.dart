import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LunchHourController extends GetxController {
  TimeOfDay _starTime = const TimeOfDay(hour: 12, minute: 00);
  TimeOfDay _endTime = const TimeOfDay(hour: 13, minute: 00);
  TimeOfDay get startTime => _starTime;
  TimeOfDay get endTime => _endTime;

  setStartTime(TimeOfDay time) {
    _starTime = time;
    update();
  }

  setEndTime(TimeOfDay time) {
    _endTime = time;
    update();
  }
}
