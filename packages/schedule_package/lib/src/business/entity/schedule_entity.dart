class ScheduleEntity {
  final int id;
  final String imagePath;
  final String description;
  final DateTime fromTime;
  final DateTime toTime;

  const ScheduleEntity({
    required this.id,
    required this.imagePath,
    required this.description,
    required this.fromTime,
    required this.toTime,
  });
}
