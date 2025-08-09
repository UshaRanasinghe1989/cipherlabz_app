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
    int userId,
    DateTime fromDate,
    DateTime toDate,
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
                  DatetimeHelpers.isBetween(fromDate, toDate, e.fromDate) &&
                  DatetimeHelpers.isBetween(fromDate, toDate, e.toDate),
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
}
