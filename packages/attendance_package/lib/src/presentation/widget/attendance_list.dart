import 'package:attendance_package/attendance_package.dart';
import 'package:attendance_package/src/presentation/widget/attendance_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_package/login_package.dart';
//import 'package:provider/provider.dart';

class AttendanceListWidget extends ConsumerStatefulWidget {
  const AttendanceListWidget({super.key});

  @override
  ConsumerState<AttendanceListWidget> createState() =>
      _AttendanceListWidgetState();
}

class _AttendanceListWidgetState extends ConsumerState<AttendanceListWidget> {
  @override
  void initState() {
    super.initState();
    //REFER LOGIN PROVIDER
    final loginProviderRef = ref.watch(loginProvider);
    final userId = loginProviderRef.user!.id;
    //REFER ATTENDANCE PROVIDER
    final attendanceProviderRef = ref.watch(attenda) //Provider.of<AttendanceProvider>(context, listen: false);
    provider.getMyAttendanceList(userId, 30);
  }

  @override
  Widget build(BuildContext context) {
    //GET REFERNCE TO ATTENDANCE PROVIDER
    final attendanceProviderValue = ref.watch(attendanceProvider);

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
