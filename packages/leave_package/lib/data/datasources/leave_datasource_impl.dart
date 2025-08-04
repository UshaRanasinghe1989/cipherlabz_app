import 'package:logger/logger.dart';
import 'package:core/core.dart';
import 'package:leave_package/leave_package.dart';

class LeaveDatasourceImpl implements LeaveDataSource {
  final logger = Logger();

  //GET MY ANNUAL LEAVE REQUESTS
  @override
  Future<List<AnnualLeaveRequestModel>> getMyAnnualLeaveRequests(
    int userId,
    DateTime fromDate,
  ) async {
    try {
      final annualLeaveList = AnnualLeaveRequestList.annualLeaveList;

      //MY ANNUAL LEAVES LIST
      List<AnnualLeaveRequestModel> myAnnualLeaveList = [];
      if (annualLeaveList.isNotEmpty) {
        myAnnualLeaveList = annualLeaveList
            .where(
              (e) =>
                  e.userId == userId &&
                  DatetimeHelpers.isAfterDateOnly(e.fromDate, fromDate),
            )
            .toList();
      }
      logger.i("datasource:myAnnualLeaveList - ${myAnnualLeaveList.length}");
      return myAnnualLeaveList;
    } catch (e, stack) {
      logger.w(
        "Exception in getMyAnnualLeaveRequests",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }

  //GET MY CASUAL LEAVE REQUESTS
  @override
  Future<List<CasualLeaveRequestModel>> getMyCasualLeaveRequests(
    int userId,
    DateTime fromDate,
  ) async {
    try {
      final casualLeaveList = CasualLeaveRequestList.casualLeaveList;

      //MY CASUAL LEAVES LIST
      List<CasualLeaveRequestModel> myCasualLeaveList = [];
      if (casualLeaveList.isNotEmpty) {
        myCasualLeaveList = casualLeaveList
            .where(
              (e) =>
                  e.userId == userId &&
                  DatetimeHelpers.isAfterDateOnly(e.fromDate, fromDate),
            )
            .toList();
      }
      logger.i("datasource:myCasualLeaveList - ${myCasualLeaveList.length}");
      return myCasualLeaveList;
    } catch (e, stack) {
      logger.w(
        "Exception in getMyCasualLeaveRequests",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }
}
