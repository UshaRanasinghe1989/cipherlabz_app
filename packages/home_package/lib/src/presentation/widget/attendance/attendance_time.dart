import 'package:attendance_package/attendance_package.dart';
import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:login_package/login_package.dart';
import 'package:shared_resources/shared_resources.dart';

class AttendanceTimeWidget extends ConsumerStatefulWidget {
  final String field;
  const AttendanceTimeWidget({super.key, required this.field});

  @override
  ConsumerState<AttendanceTimeWidget> createState() =>
      _AttendanceTimeWidgetState();
}

class _AttendanceTimeWidgetState extends ConsumerState<AttendanceTimeWidget> {
  late final id;
  @override
  void initState() {
    super.initState();

    final loginProviderValue = ref.read(loginProvider);
    id = loginProviderValue.user!.id;
  }

  @override
  Widget build(BuildContext context) {
    //FETCH ATTENDANCE
    Future.microtask(
      () => ref
          .read(attendanceProvider.notifier)
          .fetchAttendance(id, DateTime.now()),
    );

    //ATTENDANCE PROVIDER
    final attendanceState = ref.read(attendanceProvider);
    final entity = attendanceState.attendance;

    if (entity != null) {
      return Text(
        DateFormat("hh:mm a").format(
          (widget.field == "checkIn") ? entity.checkIn : entity.checkOut,
        ),
        style: TextStyle(
          color: AppColors.white,
          fontFamily: AppFonts.poppins,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      );
    } else if (attendanceState.isLoading == true) {
      return CircularProgressIndicator();
    } else if (attendanceState.failure != null) {
      return Text('Error: ${attendanceState.failure.toString()}');
    }
    return const SizedBox.shrink();
  }
}
