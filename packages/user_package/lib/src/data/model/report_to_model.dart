import 'package:user_package/src/business/entity/report_to_entity.dart';

class ReportToModel extends ReportToEntity {
  ReportToModel({
    required super.id,
    required super.superiorId,
    required super.subordinateId,
  });

  factory ReportToModel.fromJson(Map<String, dynamic> json) {
    return ReportToModel(
      id: json['id'],
      superiorId: json['superiorId'],
      subordinateId: json['subordinateId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'superiorId': superiorId, 'subordinateId': subordinateId};
  }
}
