import 'package:logger/logger.dart';
import 'package:core/core.dart';
import 'package:leave_package/leave_package.dart';

class AnnualLeaveDatasourceImpl implements AnnualLeaveDatasource {
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

  @override
  Future<List<AnnualLeaveRequestModel>> getAnnualLeaveRequestsByStatus(
    List<int> subordinateIdList,
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  ) async {
    try {
      final annualLeaveList = AnnualLeaveRequestList.annualLeaveList;
      final subordinatesAnnualLeaveList = await _getSubordinatesAnnualLeaveList(
        subordinateIdList,
        annualLeaveList,
      );
      logger.i(
        "subordinatesAnnualLeaveList ${subordinatesAnnualLeaveList.length} ***",
      );
      //MY ANNUAL LEAVES LIST
      List<AnnualLeaveRequestModel> annualLeaveListByStatus = [];
      if (annualLeaveList.isNotEmpty) {
        annualLeaveListByStatus = subordinatesAnnualLeaveList
            .where(
              (e) =>
                  DatetimeHelpers.isBetween(fromDate, toDate, e.fromDate) &&
                  DatetimeHelpers.isBetween(fromDate, toDate, e.toDate) &&
                  e.status == leaveRequestStatus,
            )
            .toList();
      }
      logger.i(
        "datasource:annualLeaveListByStatus - ${annualLeaveListByStatus.length}",
      );
      return annualLeaveListByStatus;
    } catch (e, stack) {
      logger.w(
        "Exception in getAnnualLeaveRequestsByStatus",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }

  @override
  Future<AnnualLeaveRequestModel> saveLeaveRequest(
    AnnualLeaveRequestModel annualLeaveRequestModel,
  ) async {
    try {
      //ADD NEW LEAVE REQUEST TO THE LIST
      List<AnnualLeaveRequestModel> list =
          AnnualLeaveRequestList.annualLeaveList;
      list.add(annualLeaveRequestModel);

      //GET SAVED LAST LEAVE REQUEST
      AnnualLeaveRequestModel lastLeaveRequest = await list.last;

      logger.i(
        "datasource:last saved annualLeaveRequestModel - ${lastLeaveRequest}",
      );

      return lastLeaveRequest;
    } catch (e, stack) {
      logger.w("Exception in saveLeaveRequest", error: e, stackTrace: stack);
      rethrow;
    }
  }

  //REJECT ANNUAL LEAVE
  @override
  Future<AnnualLeaveRequestModel> rejectLeaveRequest(
    AnnualLeaveRequestModel annualLeaveRequestModel,
  ) async {
    try {
      final list = AnnualLeaveRequestList.annualLeaveList;
      AnnualLeaveRequestModel? updatedModel;
      //MY CASUAL LEAVES LIST
      if (list.isNotEmpty) {
        for (var i = 0; i < list.length; i++) {
          final e = list[i];
          if (annualLeaveRequestModel.userId == e.userId &&
              annualLeaveRequestModel.fromDate == e.fromDate &&
              annualLeaveRequestModel.toDate == e.toDate &&
              e.status == LeaveRequestStatus.pending) {
            updatedModel = e.copyWith(status: LeaveRequestStatus.rejected);

            list[i] = updatedModel;
            break;
          }
        }
      }

      logger.i(
        "datasource:Annual leave request model - ${annualLeaveRequestModel} - ${DateTime.now()}",
      );
      return annualLeaveRequestModel;
    } catch (e, stack) {
      logger.w("Leave request did not find", error: e, stackTrace: stack);
      rethrow;
    }
  }

  //APPROVE LEAVE REQUEST
  @override
  Future<AnnualLeaveRequestModel> approveLeaveRequest(
    AnnualLeaveRequestModel annualLeaveRequestModel,
  ) async {
    try {
      final list = AnnualLeaveRequestList.annualLeaveList;
      AnnualLeaveRequestModel? updatedModel;
      //MY CASUAL LEAVES LIST
      if (list.isNotEmpty) {
        for (var i = 0; i < list.length; i++) {
          final e = list[i];
          if (annualLeaveRequestModel.userId == e.userId &&
              annualLeaveRequestModel.fromDate == e.fromDate &&
              annualLeaveRequestModel.toDate == e.toDate &&
              e.status == LeaveRequestStatus.pending) {
            updatedModel = e.copyWith(status: LeaveRequestStatus.approved);

            list[i] = updatedModel;
            break;
          }
        }
      }

      logger.i(
        "datasource:Annual leave request model - ${annualLeaveRequestModel} - ${DateTime.now()}",
      );
      return annualLeaveRequestModel;
    } catch (e, stack) {
      logger.w("Leave request did not find", error: e, stackTrace: stack);
      rethrow;
    }
  }

  //GET SUBORDINATES CASUAL LEAVE REQUESTS
  Future<List<AnnualLeaveRequestModel>> _getSubordinatesAnnualLeaveList(
    List<int> subordinateIdList,
    List<AnnualLeaveRequestModel> annualLeaveList,
  ) async {
    List<AnnualLeaveRequestModel> list = [];
    for (int subordinateId in subordinateIdList) {
      final matches = annualLeaveList
          .where((e) => e.userId == subordinateId)
          .toList();
      list.addAll(matches);
    }
    return list;
  }
}
