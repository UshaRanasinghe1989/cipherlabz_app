import 'package:attendance_package/attendance_package.dart';
import 'package:color_package/color_package.dart';
import 'package:core/errors/failure.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_package/login_package.dart';
import 'package:provider/provider.dart';
import 'package:shared_resources/shared_resources.dart';

class AttendanceTimeWidget extends StatefulWidget {
  final String field;
  const AttendanceTimeWidget({super.key, required this.field});

  @override
  State<AttendanceTimeWidget> createState() => _AttendanceTimeWidgetState();
}

class _AttendanceTimeWidgetState extends State<AttendanceTimeWidget> {
  late Future<Either<Failure, AttendanceEntity>> _attendanceFuture;

  @override
  void initState() {
    super.initState();
    // Cache the future once
    final provider = context.read<AttendanceProvider>();
    _attendanceFuture = provider.getAttendanceObj(user!.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<Failure, AttendanceEntity>>(
      future: _attendanceFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return Text('No data');
        }

        final either = snapshot.data!;
        return either.fold(
          (failure) => Text("Fail !"),
          (attendance) => Text(
            DateFormat("hh:mm a").format(
              (widget.field == "checkIn")
                  ? attendance.checkIn
                  : attendance.checkOut,
            ),
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppFonts.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        );
      },
    );
  }
}
