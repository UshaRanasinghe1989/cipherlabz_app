import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';
import 'package:logger/logger.dart';
import 'package:user_package/user_package.dart';

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

  //SAVE LEAVE REQUESTS
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

  //GET LEAVE REQUESTS BY STATUS
  @override
  Future<Either<Failure, List<LeaveRequestWithUserEntity>>>
  getLeaveRequestsByStatus(
    List<int> subordinateIdList,
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  ) async {
    //GET MY CASUAL LEAVE REQUESTS LIST
    List<CasualLeaveRequestModel> casualLeaveList = await casualLeaveDatasource
        .getCasualLeaveRequestsByStatus(
          subordinateIdList,
          fromDate,
          toDate,
          leaveRequestStatus,
        );

    //MODEL MAP
    List<CasualLeaveRequestEntity> casualLeaveEntityList = casualLeaveList
        .map((e) => e.toEntity())
        .toList();
    //GET LeaveRequestWithUserEntity LIST FOR CASUAL LEAVE REQUESTS
    List<LeaveRequestWithUserEntity> casualList = _getLeaveRequestWithUserList(
      casualLeaveEntityList,
    );

    //GET MY ANNUAL LEAVE REQUESTS LIST
    List<AnnualLeaveRequestModel> annualLeaveList = await annualLeaveDatasource
        .getAnnualLeaveRequestsByStatus(
          subordinateIdList,
          fromDate,
          toDate,
          leaveRequestStatus,
        );

    //MODEL MAP
    List<AnnualLeaveRequestEntity> annualLeaveEntityList = annualLeaveList
        .map((e) => e.toEntity())
        .toList();

    //GET LeaveRequestWithUserEntity LIST FOR ANNUAL LEAVE REQUESTS
    List<LeaveRequestWithUserEntity> annualList = _getLeaveRequestWithUserList(
      annualLeaveEntityList,
    );

    //CASUAL + ANNUAL LEAVE LISTS BY STATUS
    try {
      final allLeaveListByStatus = <LeaveRequestWithUserEntity>[];
      if (casualList.isNotEmpty) {
        allLeaveListByStatus.addAll(casualList);
        logger.i("casualList count : ${casualList.length} ");
      }

      if (annualList.isNotEmpty) {
        allLeaveListByStatus.addAll(annualList);
        logger.i("annualList count : ${annualList.length} ");
      }

      if (allLeaveListByStatus.isNotEmpty) {
        logger.i(
          "allLeaveListByStatus count : ${allLeaveListByStatus.length} ",
        );
        return Right(allLeaveListByStatus);
      } else {
        return Left(GeneralFailure(errorMessage: "No leave records found"));
      }
    } catch (e, stack) {
      logger.w(
        "Exception in getLeaveRequestsByStatus",
        error: e,
        stackTrace: stack,
        time: DateTime.now(),
      );
      return Left(GeneralFailure(errorMessage: "Unexpected error occurred"));
    }
  }

  //REJECT LEAVE REQUEST
  @override
  Future<Either<Failure, LeaveRequestEntity>> rejectLeaveRequest(
    LeaveRequestEntity leaveRequestEntity,
  ) async {
    if (leaveRequestEntity.leaveType == LeaveTypes.annual) {
      AnnualLeaveRequestModel leaveRequestModel = await annualLeaveDatasource
          .rejectLeaveRequest(leaveRequestEntity.toAnnualModel());

      return Right(leaveRequestModel.toEntity());
    } else {
      CasualLeaveRequestModel leaveRequestModel = await casualLeaveDatasource
          .rejectLeaveRequest(leaveRequestEntity.toCasualModel());

      return Right(leaveRequestModel.toEntity());
    }
  }

  //APPROVE LEAVE REQUEST
  @override
  Future<Either<Failure, LeaveRequestEntity>> approveLeaveRequest(
    LeaveRequestEntity leaveRequestEntity,
  ) async {
    if (leaveRequestEntity.leaveType == LeaveTypes.annual) {
      AnnualLeaveRequestModel leaveRequestModel = await annualLeaveDatasource
          .approveLeaveRequest(leaveRequestEntity.toAnnualModel());

      return Right(leaveRequestModel.toEntity());
    } else {
      CasualLeaveRequestModel leaveRequestModel = await casualLeaveDatasource
          .approveLeaveRequest(leaveRequestEntity.toCasualModel());

      return Right(leaveRequestModel.toEntity());
    }
  }

  @override
  Future<Either<Failure, List<LeaveRequestEntity>>> getEmpLeaveRequestsByStatus(
    List<int> subordinateIdList,
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  ) async {
    //GET MY CASUAL LEAVE REQUESTS LIST
    List<CasualLeaveRequestModel> casualLeaveList = await casualLeaveDatasource
        .getCasualLeaveRequestsByStatus(
          subordinateIdList,
          fromDate,
          toDate,
          leaveRequestStatus,
        );

    //MODEL MAP
    List<CasualLeaveRequestEntity> casualLeaveEntityList = casualLeaveList
        .map((e) => e.toEntity())
        .toList();

    //GET MY ANNUAL LEAVE REQUESTS LIST
    List<AnnualLeaveRequestModel> annualLeaveList = await annualLeaveDatasource
        .getAnnualLeaveRequestsByStatus(
          subordinateIdList,
          fromDate,
          toDate,
          leaveRequestStatus,
        );

    //MODEL MAP
    List<AnnualLeaveRequestEntity> annualLeaveEntityList = annualLeaveList
        .map((e) => e.toEntity())
        .toList();

    //CASUAL + ANNUAL LEAVE LISTS BY STATUS
    try {
      final allLeaveListByStatus = <LeaveRequestEntity>[];
      if (casualLeaveEntityList.isNotEmpty) {
        allLeaveListByStatus.addAll(casualLeaveEntityList);
        logger.i("casualList count : ${casualLeaveEntityList.length} ");
      }

      if (annualLeaveEntityList.isNotEmpty) {
        allLeaveListByStatus.addAll(annualLeaveEntityList);
        logger.i("annualList count : ${annualLeaveEntityList.length} ");
      }

      if (allLeaveListByStatus.isNotEmpty) {
        logger.i(
          "allLeaveListByStatus count : ${allLeaveListByStatus.length} ",
        );
        return Right(allLeaveListByStatus);
      } else {
        logger.i("leave_repository_impl : No leave records found");
        return Left(GeneralFailure(errorMessage: "No leave records found"));
      }
    } catch (e, stack) {
      logger.w(
        "Exception in getLeaveRequestsByStatus",
        error: e,
        stackTrace: stack,
        time: DateTime.now(),
      );
      return Left(GeneralFailure(errorMessage: "Unexpected error occurred"));
    }
  }

  List<LeaveRequestWithUserEntity> _getLeaveRequestWithUserList(
    List<LeaveRequestEntity> leaveEntityList,
  ) {
    final usersSet = UserSet.usersSet;
    return leaveEntityList.map((leave) {
      final matchingUser = usersSet.firstWhere(
        (user) => user.id == leave.userId,
        //orElse: () => UserEntity(id: -1, name: 'Unknown'), // fallback if not found
      );

      return LeaveRequestWithUserEntity(
        leaveRequestEntity: leave,
        userEntity: matchingUser,
      );
    }).toList();
  }
}
