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
    List<int> subordinateIdList,
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  ) async {
    try {
      final casualLeaveList = CasualLeaveRequestList.casualLeaveList;
      final subordinatesCasualLeaveList = await _getSubordinatesCasualLeaveList(
        subordinateIdList,
        casualLeaveList,
      );
      logger.i(
        "subordinatesCasualLeaveList ${subordinatesCasualLeaveList.length} ${fromDate} , ${toDate}",
      );
      //SUBORDINATES CASUAL LEAVES LIST
      List<CasualLeaveRequestModel> casualLeaveListByStatus = [];
      if (casualLeaveList.isNotEmpty) {
        casualLeaveListByStatus = subordinatesCasualLeaveList
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

  //SAVE LEAVE REQUEST
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

  //REJECT CASUAL LEAVE REQUEST
  @override
  Future<CasualLeaveRequestModel> rejectLeaveRequest(
    CasualLeaveRequestModel casualLeaveRequestModel,
  ) async {
    try {
      final list = CasualLeaveRequestList.casualLeaveList;
      CasualLeaveRequestModel? updatedModel;
      //MY CASUAL LEAVES LIST
      if (list.isNotEmpty) {
        for (var i = 0; i < list.length; i++) {
          final e = list[i];
          if (casualLeaveRequestModel.userId == e.userId &&
              casualLeaveRequestModel.fromDate == e.fromDate &&
              casualLeaveRequestModel.toDate == e.toDate &&
              e.status == LeaveRequestStatus.pending) {
            updatedModel = e.copyWith(status: LeaveRequestStatus.rejected);

            list[i] = updatedModel;
            break;
          }
        }
      }

      logger.i(
        "datasource:casual leave request model - ${casualLeaveRequestModel} - ${DateTime.now()}",
      );
      return casualLeaveRequestModel;
    } catch (e, stack) {
      logger.w("Leave request did not find", error: e, stackTrace: stack);
      rethrow;
    }
  }

  //APPROVE LEAVE REQUEST
  @override
  Future<CasualLeaveRequestModel> approveLeaveRequest(
    CasualLeaveRequestModel casualLeaveRequestModel,
  ) async {
    try {
      final list = CasualLeaveRequestList.casualLeaveList;
      CasualLeaveRequestModel? updatedModel;
      //MY CASUAL LEAVES LIST
      if (list.isNotEmpty) {
        for (var i = 0; i < list.length; i++) {
          final e = list[i];
          if (casualLeaveRequestModel.userId == e.userId &&
              casualLeaveRequestModel.fromDate == e.fromDate &&
              casualLeaveRequestModel.toDate == e.toDate &&
              e.status == LeaveRequestStatus.pending) {
            updatedModel = e.copyWith(status: LeaveRequestStatus.approved);

            list[i] = updatedModel;
            break;
          }
        }
      }

      logger.i(
        "datasource:casual leave request model - ${casualLeaveRequestModel} - ${DateTime.now()}",
      );
      return casualLeaveRequestModel;
    } catch (e, stack) {
      logger.w("Leave request did not find", error: e, stackTrace: stack);
      rethrow;
    }
  }

  //GET SUBORDINATES CASUAL LEAVE REQUESTS
  Future<List<CasualLeaveRequestModel>> _getSubordinatesCasualLeaveList(
    List<int> subordinateIdList,
    List<CasualLeaveRequestModel> casualLeaveList,
  ) async {
    List<CasualLeaveRequestModel> list = [];
    for (int subordinateId in subordinateIdList) {
      final matches = casualLeaveList
          .where((e) => e.userId == subordinateId)
          .toList();
      list.addAll(matches);
    }
    logger.i("_getSubordinatesCasualLeaveList result : ${list.length}");
    return list;
  }
}
