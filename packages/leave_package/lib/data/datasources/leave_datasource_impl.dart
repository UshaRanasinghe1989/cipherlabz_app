import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

class LeaveDatasourceImpl implements LeaveDataSource {
  Future<Either<Failure, List<dynamic>>> getMyLeaveRequests(int userId) async {
    DateTime now = DateTime.now();
    DateTime fromDate = DateTime(now.year, now.month, now.day);

    final casualLeaveList = CasualLeaveRequestList.casualLeaveList;
    final annualLeaveList = AnnualLeaveRequestList.annualLeaveList;
    //MY CASUAL LEAVES LIST
    List<CasualLeaveRequestModel> myCasualLeaveList = [];
    if (casualLeaveList.isNotEmpty) {
      myCasualLeaveList = casualLeaveList
          .where(
            (e) =>
                e.userId == userId &&
                DatetimeHelpers.isSameDay(e.fromDate, fromDate),
          )
          .toList();
    }
    //MY ANNUAL LEAVES LIST
    List<AnnualLeaveRequestModel> myAnnualLeaveList = [];
    if (annualLeaveList.isNotEmpty) {
      myAnnualLeaveList = annualLeaveList
          .where(
            (e) =>
                e.userId == userId &&
                DatetimeHelpers.isSameDay(e.fromDate, fromDate),
          )
          .toList();
    }
    //CASUAL + ANNUAL LEAVES LIST
    final myAllLeaveList = <dynamic>[];
    if (myCasualLeaveList.isNotEmpty) {
      myAllLeaveList.addAll(myCasualLeaveList);
    }

    if (myAnnualLeaveList.isNotEmpty) {
      myAllLeaveList.addAll(myAnnualLeaveList);
    }

    if (myAllLeaveList.isNotEmpty) {
      return Right(myAllLeaveList);
    } else {
      return Left(GeneralFailure(errorMessage: "Failed"));
    }
  }
}
