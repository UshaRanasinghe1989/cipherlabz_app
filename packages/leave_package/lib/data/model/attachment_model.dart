class AttachmentModel {
  final String name;
  final String mimeType;
  final String base64Data; // base64-encoded file content

  AttachmentModel({
    required this.name,
    required this.mimeType,
    required this.base64Data,
  });
}
