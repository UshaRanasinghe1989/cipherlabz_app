import 'package:color_package/color_package.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:leave_package/leave_package.dart';

class MyLeaveRequestItem extends StatelessWidget {
  final LeaveRequestEntity entity;
  const MyLeaveRequestItem({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 0.0,
        bottom: 0.0,
      ),
      child: Card.outlined(
        color: AppColors.white,
        //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0.0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: _getCardBorderColor(entity.status)),
        ),
        child: Column(
          children: [
            //ROW 1
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //LEAVE DATE TEXT
                  Text(
                    "Date",
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  //LEAVE REQUEST STATUS
                  Container(
                    width: 75,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: _leaveRequestStatusBackgroundColor(entity.status),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      _getStatusString(entity.status),
                      style: TextStyle(
                        color: _leaveRequestStatusFontColor(entity.status),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //LEAVE FROM DATE - TO DATE
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 0.0,
                bottom: 0.0,
              ),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "${DatetimeHelpers.formattedDate(entity.fromDate)} - ${DatetimeHelpers.formattedDate(entity.toDate)}",
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            //DIVIDER
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 5.0,
                bottom: 0.0,
              ),
              child: Divider(color: AppColors.greyEAEAEA),
            ), //#EAEAEA
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 0.0,
                bottom: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //LEAVE NUMBER OF DAYS
                  Column(
                    children: [
                      _customTextWidget("Apply Days"),
                      Text(
                        "${DatetimeHelpers.differenceDays(fromDate: entity.fromDate, toDate: entity.toDate)}",
                      ),
                    ],
                  ),
                  Column(
                    children: [_customTextWidget("Leave Balance"), Text("-")],
                  ),
                  Column(
                    children: [_customTextWidget("Approved By"), Text("-")],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //GET CARD BORDER COLOR
  Color _getCardBorderColor(LeaveRequestStatus status) {
    if (status == LeaveRequestStatus.pending) {
      return AppColors.orangeF0C083; //#F0C083
    } else if (status == LeaveRequestStatus.approved) {
      return AppColors.green00BC61; //#00BC61
    } else if (status == LeaveRequestStatus.rejected) {
      return AppColors.pinkE40079; //#E40079
    } else {
      return Colors.transparent;
    }
  }

  //LEAVE REQUEST STATUS FONT COLOR
  Color _leaveRequestStatusFontColor(LeaveRequestStatus status) {
    if (status == LeaveRequestStatus.pending) {
      return AppColors.orangeF0C083; //#F0C083
    } else if (status == LeaveRequestStatus.approved) {
      return AppColors.green00BC61; //#00BC61
    } else if (status == LeaveRequestStatus.rejected) {
      return AppColors.pinkE40079; //#E40079
    } else {
      return Colors.transparent;
    }
  }

  //LEAVE REQUEST STATUS FONT COLOR
  Color _leaveRequestStatusBackgroundColor(LeaveRequestStatus status) {
    if (status == LeaveRequestStatus.pending) {
      return AppColors.orangeFFF0DC; //#FFF0DC
    } else if (status == LeaveRequestStatus.approved) {
      return AppColors.green00A3543D; //#00A3543D
    } else if (status == LeaveRequestStatus.rejected) {
      return AppColors.pinkE4007912; //#E4007912
    } else {
      return Colors.transparent;
    }
  }

  //CUSTOMIZED TEXT
  Widget _customTextWidget(String txt) {
    return Text(
      txt,
      style: TextStyle(
        color: AppColors.grey00000091,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    );
  }

  //GET STATUS STRING
  String _getStatusString(LeaveRequestStatus status) {
    if (status == LeaveRequestStatus.approved) {
      return "Approved";
    } else if (status == LeaveRequestStatus.pending) {
      return "Pending";
    } else {
      return "Rejected";
    }
  }
}
