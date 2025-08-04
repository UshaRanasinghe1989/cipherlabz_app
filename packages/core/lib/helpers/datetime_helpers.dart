import 'package:intl/intl.dart';

class DatetimeHelpers {
  //IS SAME DAY
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  //IS AFTER
  static bool isAfterDateOnly(DateTime a, DateTime b) {
    final dateA = DateTime(a.year, a.month, a.day);
    final dateB = DateTime(b.year, b.month, b.day);
    return dateA.isAfter(dateB);
  }

  //FORMAT DATE
  static String formattedDate(DateTime date) {
    return DateFormat("d MMMM yyyy").format(date);
  }

  //DATE DIFFERENCE
  static int differenceDays({required fromDate, required toDate}) {
    DateTime date1 = DateTime(fromDate.year, fromDate.month, fromDate.day);
    DateTime date2 = DateTime(toDate.year, toDate.month, toDate.day);

    return date1.difference(date2).inDays;
  }
}
