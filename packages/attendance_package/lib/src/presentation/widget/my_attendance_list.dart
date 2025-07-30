import 'package:attendance_package/src/presentation/widget/attendance_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuperUserAttendanceListWidget extends ConsumerWidget {
  const SuperUserAttendanceListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AttendanceListWidget();
  }
}
