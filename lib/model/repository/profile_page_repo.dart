import '../../core/values/app_assets.dart';
import '../entities/working_day.dart';

class ProfilePageRepo {
  static final List<String> storeAppearance = [
    AppAssets.imPicker1,
    AppAssets.imPicker2
  ];
  static final List<String> interiorAppearance = [
    AppAssets.imPicker1,
    AppAssets.imPicker2
  ];
  static final List<String> foodPhotos = [
    AppAssets.imPicker3,
    AppAssets.imPicker4,
    AppAssets.imPicker5
  ];
  static final List<String> menuPhotos = [
    AppAssets.imPicker6,
    AppAssets.imPicker7
  ];

  static final List<WorkingDay> workDays = [
    const WorkingDay(day: "月"),
    const WorkingDay(day: "火"),
    const WorkingDay(day: "水"),
    const WorkingDay(day: "木"),
    const WorkingDay(day: "金"),
    const WorkingDay(day: "祝"),
    const WorkingDay(day: "日"),
  ];
}
