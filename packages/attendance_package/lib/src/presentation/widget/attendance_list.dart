import 'package:attendance_package/attendance_package.dart';
import 'package:attendance_package/src/presentation/widget/attendance_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:login_package/login_package.dart';
import 'package:provider/provider.dart';

class AttendanceListWidget extends StatefulWidget {
  const AttendanceListWidget({super.key});

  @override
  State<AttendanceListWidget> createState() => _AttendanceListWidgetState();
}

class _AttendanceListWidgetState extends State<AttendanceListWidget> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AttendanceProvider>(context, listen: false);
    provider.getMyAttendanceList(user!.id, 30);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AttendanceProvider>(
        builder: (BuildContext context, AttendanceProvider provider, _) {
          if (provider.attendanceList.isEmpty && provider.failure == null) {
            //IN PROGRESS
            return Center(child: CircularProgressIndicator());
          } else if (provider.failure != null) {
            //FAILURE
            return Center(child: Text(provider.failure.toString()));
          } else {
            return ListView.builder(
              itemCount: provider.attendanceList.length,
              itemBuilder: (context, index) {
                final item = provider.attendanceList[index];
                return AttendanceDetailItem(entity: item);
              },
            );
          }
        },
        // (BuildContext context, AttendanceProvider provider, Widget? child) {
        //   return SingleChildScrollView(
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(
        //         horizontal: 10.0,
        //         vertical: 5.0,
        //       ),
        //       child: Container(
        //         margin: EdgeInsets.symmetric(horizontal: 20),
        //         child: AttendanceDetailItem(pro),
        //       ),
        //     ),
        //   );
        // },
      ),
    );
  }
}
