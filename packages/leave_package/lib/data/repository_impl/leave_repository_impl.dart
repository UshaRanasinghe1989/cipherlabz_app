import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';
import 'package:logger/logger.dart';

class LeaveRepositoryImpl implements LeaveRepository {
  final logger = Logger();
  final LeaveDataSource leaveDataSource;

  LeaveRepositoryImpl({required this.leaveDataSource});

  @override
  Future<Either<Failure, List<LeaveRequestEntity>>> getMyLeaveRequests(
    int userId,
  ) async {
    DateTime now = DateTime.now();
    //RETRIEVE LEAVE REQUESTS FROM DATE
    DateTime fromDate = DateTime(now.year, now.month, now.day);

    //GET MY CASUAL LEAVE REQUESTS LIST
    List<CasualLeaveRequestModel> myCasualLeaveList = await leaveDataSource
        .getMyCasualLeaveRequests(userId, fromDate);

    //GET MY ANNUAL LEAVE REQUESTS LIST
    List<AnnualLeaveRequestModel> myAnnualLeaveList = await leaveDataSource
        .getMyAnnualLeaveRequests(userId, fromDate);

    //MODEL MAP
    List<CasualLeaveRequestEntity> myCasualLeaveEntityList = myCasualLeaveList
        .map((e) => e.toEntity())
        .toList();

    List<AnnualLeaveRequestEntity> myAnnualLeaveEntityList = myAnnualLeaveList
        .map((e) => e.toEntity())
        .toList();

    //CASUAL + ANNUAL LEAVE LISTS
    try {
      final myAllLeaveList = <LeaveRequestEntity>[];
      if (myCasualLeaveEntityList.isNotEmpty) {
        myAllLeaveList.addAll(myCasualLeaveEntityList);
        logger.i(
          "myCasualLeaveEntityList count : ${myCasualLeaveEntityList.length} ",
        );
      }

      if (myAnnualLeaveEntityList.isNotEmpty) {
        myAllLeaveList.addAll(myAnnualLeaveEntityList);
        logger.i(
          "myAnnualLeaveEntityList count : ${myAnnualLeaveEntityList.length} ",
        );
      }

      if (myAllLeaveList.isNotEmpty) {
        logger.i("myAllLeaveList count : ${myAllLeaveList.length} ");
        return Right(myAllLeaveList);
      } else {
        return Left(GeneralFailure(errorMessage: "No leave records found"));
      }
    } catch (e, stack) {
      logger.w(
        "Exception in getMyLeaveRequests",
        error: e,
        stackTrace: stack,
        time: DateTime.now(),
      );
      return Left(GeneralFailure(errorMessage: "Unexpected error occurred"));
    }
  }
}
