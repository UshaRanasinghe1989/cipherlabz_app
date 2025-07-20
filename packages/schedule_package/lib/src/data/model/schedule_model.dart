import 'package:schedule_package/src/business/entity/schedule_entity.dart';

class ScheduleModel extends ScheduleEntity {
  const ScheduleModel({
    required super.id,
    required super.imagePath,
    required super.description,
    required super.fromTime,
    required super.toTime,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'],
      imagePath: json['imagePath'],
      description: json['description'],
      fromTime: json['fromTime'],
      toTime: json['toTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'description': description,
      'fromTime': fromTime,
      'toTime': toTime,
    };
  }
}
