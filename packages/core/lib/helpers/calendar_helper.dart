class CalendarHelper {
  static int getWorkingDays(
    DateTime start,
    DateTime end,
    List<DateTime> holidays,
  ) {
    // Total days including start and end
    int totalDays = end.difference(start).inDays + 1;

    // Full weeks
    int fullWeeks = totalDays ~/ 7;
    int workDays = fullWeeks * 5;

    // Remaining days
    int remainingDays = totalDays % 7;

    for (int i = 0; i < remainingDays; i++) {
      int weekday = start.add(Duration(days: fullWeeks * 7 + i)).weekday;
      if (weekday != DateTime.saturday && weekday != DateTime.sunday) {
        workDays++;
      }
    }

    // subtract holidays that are weekdays and within range
    for (DateTime holiday in holidays) {
      DateTime normalizedHoliday = DateTime(
        holiday.year,
        holiday.month,
        holiday.day,
      );

      if ((normalizedHoliday.isAfter(start) ||
              normalizedHoliday.isAtSameMomentAs(start)) &&
          (normalizedHoliday.isBefore(end) ||
              normalizedHoliday.isAtSameMomentAs(end))) {
        if (normalizedHoliday.weekday != DateTime.saturday &&
            normalizedHoliday.weekday != DateTime.sunday) {
          workDays--;
        }
      }
    }

    return workDays;
  }
}
