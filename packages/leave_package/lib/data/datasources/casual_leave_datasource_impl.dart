import 'package:core/core.dart';
import 'package:leave_package/leave_package.dart';
import 'package:logger/logger.dart';

class CasualLeaveDatasourceImpl implements CasualLeaveDatasource {
  final logger = Logger();

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
      logger.i(
        "datasource:myCasualLeaveList - ${myCasualLeaveList.length} - ${DateTime.now()}",
      );
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

  @override
  Future<List<CasualLeaveRequestModel>> getCasualLeaveRequestsByStatus(
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  ) async {
    try {
      final casualLeaveList = CasualLeaveRequestList.casualLeaveList;

      //MY CASUAL LEAVES LIST
      List<CasualLeaveRequestModel> casualLeaveListByStatus = [];
      if (casualLeaveList.isNotEmpty) {
        casualLeaveListByStatus = casualLeaveList
            .where(
              (e) =>
                  DatetimeHelpers.isBetween(fromDate, toDate, e.fromDate) &&
                  DatetimeHelpers.isBetween(fromDate, toDate, e.toDate) &&
                  e.status == leaveRequestStatus,
            )
            .toList();
      }
      logger.i(
        "datasource:casualLeaveListByStatus - ${casualLeaveListByStatus.length} - ${DateTime.now()}",
      );
      return casualLeaveListByStatus;
    } catch (e, stack) {
      logger.w(
        "Exception in getCasualLeaveRequestsByStatus",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }

  @override
  Future<CasualLeaveRequestModel> saveLeaveRequest(
    CasualLeaveRequestModel casualLeaveRequestModel,
  ) async {
    try {
      //ADD NEW LEAVE REQUEST TO THE LIST
      List<CasualLeaveRequestModel> list =
          CasualLeaveRequestList.casualLeaveList;
      list.add(casualLeaveRequestModel);

      //GET SAVED LAST LEAVE REQUEST
      CasualLeaveRequestModel lastLeaveRequest = await list.last;

      logger.i(
        "datasource:last saved casualLeaveRequestModel - ${lastLeaveRequest} - ${DateTime.now()}",
      );

      return lastLeaveRequest;
    } catch (e, stack) {
      logger.w("Exception in saveLeaveRequest", error: e, stackTrace: stack);
      rethrow;
    }
  }
}
