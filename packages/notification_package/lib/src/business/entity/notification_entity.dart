class NotificationEntity {
  final int id;
  final int userId;
  final String title;
  final String iconName;
  final String message;
  final DateTime createdAt;

  NotificationEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.iconName,
    required this.message,
    required this.createdAt,
  });
}
