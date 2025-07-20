import 'package:announcement_package/src/business/entity/announcement_entity.dart';

class AnnouncementModel extends AnnouncementEntity {
  const AnnouncementModel({required super.id, required super.description});

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(id: json['id'], description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'description': description};
  }
}
