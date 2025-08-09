import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';
import 'package:logger/logger.dart';

class LeaveRepositoryImpl implements LeaveRepository {
  final logger = Logger();
  final CasualLeaveDatasource casualLeaveDatasource;
  final AnnualLeaveDatasource annualLeaveDatasource;

  LeaveRepositoryImpl(this.casualLeaveDatasource, this.annualLeaveDatasource);

  @override
  Future<Either<Failure, List<LeaveRequestEntity>>> getMyLeaveRequests(
    int userId,
  ) async {
    DateTime now = DateTime.now();
    //RETRIEVE LEAVE REQUESTS FROM DATE
    DateTime fromDate = DateTime(now.year, now.month, now.day);

    //GET MY CASUAL LEAVE REQUESTS LIST
    List<CasualLeaveRequestModel> myCasualLeaveList =
        await casualLeaveDatasource.getMyCasualLeaveRequests(userId, fromDate);

    //GET MY ANNUAL LEAVE REQUESTS LIST
    List<AnnualLeaveRequestModel> myAnnualLeaveList =
        await annualLeaveDatasource.getMyAnnualLeaveRequests(userId, fromDate);

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

  @override
  Future<Either<Failure, List<LeaveRequestEntity>>>
  getCasualLeaveRequestsByStatus(
    int userId,
    DateTime fromDate,
    DateTime toDate,
  ) async {
    //GET MY CASUAL LEAVE REQUESTS LIST
    List<CasualLeaveRequestModel> leaveList = await casualLeaveDatasource
        .getCasualLeaveRequestsByStatus(userId, fromDate, toDate);

    //MODEL MAP
    List<CasualLeaveRequestEntity> leaveEntityList = leaveList
        .map((e) => e.toEntity())
        .toList();

    try {
      if (leaveEntityList.isNotEmpty) {
        logger.i("leaveEntityList count : ${leaveEntityList.length} ");
        return Right(leaveEntityList);
      } else {
        return Left(GeneralFailure(errorMessage: "No leave records found"));
      }
    } catch (e, stack) {
      logger.w(
        "Exception in getCasualLeaveRequestsByStatus",
        error: e,
        stackTrace: stack,
        time: DateTime.now(),
      );
      return Left(GeneralFailure(errorMessage: "Unexpected error occurred"));
    }
  }

  @override
  Future<Either<Failure, List<LeaveRequestEntity>>>
  getAnnualLeaveRequestsByStatus(
    int userId,
    DateTime fromDate,
    DateTime toDate,
  ) async {
    //GET ANNUAL LEAVE REQUESTS LIST
    List<AnnualLeaveRequestModel> leaveList = await annualLeaveDatasource
        .getAnnualLeaveRequestsByStatus(userId, fromDate, toDate);

    //MODEL MAP
    List<AnnualLeaveRequestEntity> leaveEntityList = leaveList
        .map((e) => e.toEntity())
        .toList();

    try {
      if (leaveEntityList.isNotEmpty) {
        logger.i("leaveEntityList count : ${leaveEntityList.length} ");
        return Right(leaveEntityList);
      } else {
        return Left(GeneralFailure(errorMessage: "No leave records found"));
      }
    } catch (e, stack) {
      logger.w(
        "Exception in getAnnualLeaveRequestsByStatus",
        error: e,
        stackTrace: stack,
        time: DateTime.now(),
      );
      return Left(GeneralFailure(errorMessage: "Unexpected error occurred"));
    }
  }

  @override
  Future<Either<Failure, LeaveRequestEntity>> saveLeaveRequest(
    int userId,
    LeaveTypes leaveType,
    DateTime fromDate,
    DateTime toDate,
    String? reason,
    AttachmentEntity? attachment,
  ) async {
    LeaveRequestEntity? leaveRequestEntity;
    final casualLeaveList = CasualLeaveRequestList.casualLeaveList;
    final annualLeaveList = AnnualLeaveRequestList.annualLeaveList;

    if (leaveType == LeaveTypes.casual) {
      //GENERATE NEXT CASUAL ID
      int nextId = 0;
      if (casualLeaveList.isNotEmpty) {
        nextId = casualLeaveList.length + 1;
      } else {
        nextId = 1;
      }
      //CASUAL LEAVE MODEL OBJECT
      CasualLeaveRequestModel casualLeaveRequestModel =
          await casualLeaveDatasource.saveLeaveRequest(
            CasualLeaveRequestModel(
              id: nextId,
              userId: userId,
              leaveType: leaveType,
              fromDate: fromDate,
              toDate: toDate,
              reason: reason,
              attachment: attachment?.toModel(),
              status: LeaveRequestStatus.pending,
            ),
          );
      //LAST SAVED LEAVE REQUEST
      leaveRequestEntity = casualLeaveRequestModel.toEntity();
    } else if (leaveType == LeaveTypes.annual) {
      //GENERATE NEXT ANNUAL LEAVE LIST ID
      int nextId = 0;
      if (annualLeaveList.isNotEmpty) {
        nextId = annualLeaveList.length + 1;
      } else {
        nextId = 1;
      }
      //ANNUAL LEAVE MODEL OBJECT
      AnnualLeaveRequestModel annualLeaveRequestModel =
          await annualLeaveDatasource.saveLeaveRequest(
            AnnualLeaveRequestModel(
              id: nextId,
              userId: userId,
              leaveType: leaveType,
              fromDate: fromDate,
              toDate: toDate,
              reason: reason!,
              attachment: attachment?.toModel(),
              status: LeaveRequestStatus.pending,
            ),
          );
      //LAST SAVED LEAVE REQUEST
      leaveRequestEntity = annualLeaveRequestModel.toEntity();
    }

    try {
      if (leaveRequestEntity != null) {
        return Right(leaveRequestEntity);
      } else {
        return Left(GeneralFailure(errorMessage: "No leave records found"));
      }
    } catch (e, stack) {
      logger.w(
        "Exception in getAnnualLeaveRequestsByStatus",
        error: e,
        stackTrace: stack,
        time: DateTime.now(),
      );
      return Left(GeneralFailure(errorMessage: "Unexpected error occurred"));
    }
  }
}
