import 'package:color_package/color_package.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/application/providers/leave_provider.dart';
import 'package:leave_package/leave_package.dart';

class PendingLeaveRequestCard extends ConsumerWidget {
  final LeaveRequestWithUserEntity entity;
  final VoidCallback onReload;

  PendingLeaveRequestCard({
    super.key,
    required this.entity,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entity.userEntity.name,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                Text(
                  DatetimeHelpers.formattedDate(
                    entity.leaveRequestEntity.fromDate,
                  ),
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.cancel_outlined, color: AppColors.white),
                  onPressed: () async {
                    await ref
                        .read(leaveProvider.notifier)
                        .rejectLeaveRequest(entity.leaveRequestEntity);
                    onReload();
                  },
                  label: Text(
                    "Reject",
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.redDE3F3F,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: AppColors.white,
                  ),
                  onPressed: () async {
                    await ref
                        .read(leaveProvider.notifier)
                        .rejectLeaveRequest(entity.leaveRequestEntity);
                    onReload();
                  },
                  label: Text(
                    "Approve",
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.green00A354,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
