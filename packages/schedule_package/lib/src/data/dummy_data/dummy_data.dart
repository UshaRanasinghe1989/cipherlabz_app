import 'package:schedule_package/src/data/model/schedule_model.dart';

//SCHEDULE LIST
class ScheduleData {
  static final List<ScheduleModel> scheduleItemsList = [
    ScheduleModel(
      id: 0,
      imagePath: "packages/schedule_package/assets/image1.png",
      description: "CEO Meeting",
      fromTime: DateTime(2025, 7, 19, 16, 30),
      toTime: DateTime(2025, 7, 19, 18, 30),
    ),
    ScheduleModel(
      id: 1,
      imagePath: "packages/schedule_package/assets/image2.png",
      description: "Lahiru`s birthday",
      fromTime: DateTime(2025, 7, 19, 09, 30),
      toTime: DateTime(2025, 7, 19, 11, 30),
    ),
    ScheduleModel(
      id: 2,
      imagePath: "packages/schedule_package/assets/image3.png",
      description: "SE interview",
      fromTime: DateTime(2025, 7, 19, 14, 00),
      toTime: DateTime(2025, 7, 19, 15, 00),
    ),
  ];
}
