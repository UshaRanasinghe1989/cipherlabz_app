import 'package:leave_package/business/entity/attachment_entity.dart';

class AttachmentModel {
  final String name;
  final String mimeType;
  final String base64Data; // base64-encoded file content

  AttachmentModel({
    required this.name,
    required this.mimeType,
    required this.base64Data,
  });

  AttachmentEntity toEntity() {
    return AttachmentEntity(
      name: name,
      mimeType: mimeType,
      base64Data: base64Data,
    );
  }
}
