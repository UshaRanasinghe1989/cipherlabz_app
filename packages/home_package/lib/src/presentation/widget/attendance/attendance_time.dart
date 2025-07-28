import 'package:attendance_package/attendance_package.dart';
import 'package:color_package/color_package.dart';
import 'package:core/errors/failure.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:login_package/login_package.dart';
import 'package:provider/provider.dart';
import 'package:shared_resources/shared_resources.dart';

class AttendanceTimeWidget extends ConsumerStatefulWidget {
  final String field;
  const AttendanceTimeWidget({super.key, required this.field});

  @override
  ConsumerState<AttendanceTimeWidget> createState() =>
      _AttendanceTimeWidgetState();
}

class _AttendanceTimeWidgetState extends ConsumerState<AttendanceTimeWidget> {
  late Future<Either<Failure, AttendanceEntity>> _attendanceFuture;

  @override
  void initState() {
    final loginProviderValue = ref.watch(loginProvider);
    final id = loginProviderValue.user!.id;
    super.initState();
    // Cache the future once
    final provider = context.read<AttendanceProvider>();
    _attendanceFuture = provider.getAttendanceObj(id);
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
