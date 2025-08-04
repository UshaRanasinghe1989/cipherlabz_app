import 'package:color_package/color_package.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leave_package/business/entity/leave_request_entity.dart';
import 'package:leave_package/business/enums/leave_request_status.dart';
import 'package:logger/logger.dart';

class MyLeaveRequestItem extends StatelessWidget {
  final LeaveRequestEntity entity;
  const MyLeaveRequestItem({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: 2.0,
      shape: Border.all(color: _getCardBorderColor(entity.status)),
      child: Column(
        children: [
          //ROW 1
          Row(
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
                decoration: BoxDecoration(
                  color: _leaveRequestStatusBackgroundColor(entity.status),
                ),
                child: Text(
                  entity.status.toString(),
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
          //LEAVE FROM DATE - TO DATE
          Text(
            "${DatetimeHelpers.formattedDate(entity.fromDate)} - ${DatetimeHelpers.formattedDate(entity.toDate)}",
            style: TextStyle(
              color: AppColors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          //DIVIDER
          Divider(color: AppColors.greyEAEAEA), //#EAEAEA
          Row(
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
                children: [
                  _customTextWidget("Leave Balance"),
                  // ToDo
                ],
              ),
              Column(children: [_customTextWidget("Approved By"), Text("-")]),
            ],
          ),
        ],
      ),
    );
  }

  //GET CARD BORDER COLOR
  Color _getCardBorderColor(LeaveRequestStatus status) {
    switch (status.toString()) {
      case "pending":
        return AppColors.orangeF0C083; //#F0C083
      case "approved":
        return AppColors.green00BC61; //#00BC61
      case "rejected":
        return AppColors.pinkE40079; //#E40079
      default:
        return Colors.transparent;
    }
  }

  //LEAVE REQUEST STATUS FONT COLOR
  Color _leaveRequestStatusFontColor(LeaveRequestStatus status) {
    switch (status.toString()) {
      case "pending":
        return AppColors.orangeF0C083; //#F0C083
      case "approved":
        return AppColors.green00BC61; //#00BC61
      case "rejected":
        return AppColors.pinkE40079; //#E40079
      default:
        return Colors.transparent;
    }
  }

  //LEAVE REQUEST STATUS FONT COLOR
  Color _leaveRequestStatusBackgroundColor(LeaveRequestStatus status) {
    switch (status.toString()) {
      case "pending":
        return AppColors.orangeFFF0DC; //#FFF0DC
      case "approved":
        return AppColors.green00A3543D; //#00A3543D
      case "rejected":
        return AppColors.pinkE4007912; //#E4007912
      default:
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
}
