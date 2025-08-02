import 'package:leave_package/leave_package.dart';

class AttachmentEntity {
  final String name;
  final String mimeType;
  final String base64Data; // base64-encoded file content

  AttachmentEntity({
    required this.name,
    required this.mimeType,
    required this.base64Data,
  });

  AttachmentModel toModel() {
    return AttachmentModel(
      name: name,
      mimeType: mimeType,
      base64Data: base64Data,
    );
  }
}
