import 'package:attendance_package/attendance_package.dart';
import 'package:attendance_package/src/enum/attendance_status.dart';
import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class AttendanceDetailItem extends StatelessWidget {
  final AttendanceEntity entity;
  const AttendanceDetailItem({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    print("Check in : ${entity.checkIn}");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: _getDetailCardBorderColor(entity.status, entity.checkIn),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //DISPLAY DATE
                    todayText(entity),
                    //DISPLAY STATUS
                    !_isSameDay(entity.checkIn, DateTime.now())
                        ? Container(
                            width: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              //CUSTOMIZED STATUS
                              //STATUS BACKGROUND COLOR
                              color: _getStatusBackgroundColor(entity.status),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              statusString(entity.status),
                              style: TextStyle(
                                //STATUS FONT COLOR
                                color: _getStatusFontColor(entity.status),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : Text(""),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            //CHECK IN ICON
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                //CUSTOM CHECK IN ICON COLOR
                                //CHECK IN BORDER COLOR
                                border: Border.all(
                                  color: _getCheckInIconBorderColor(
                                    entity.status,
                                    entity.checkIn,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(50),
                                //CHECK IN ICON BACKGROUND COLOR
                                color: _getCheckInIconBackgroundColor(
                                  entity.checkIn,
                                ),
                              ),
                              child: SvgPicture.asset(
                                "packages/shared_resources/assets/icons/check_in.svg",
                                width: 40,
                                height: 40,
                                colorFilter: ColorFilter.mode(
                                  //CHECK IN ICON COLOR
                                  _getCheckInIconColor(
                                    entity.status,
                                    entity.checkIn,
                                  ),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            //CHECK IN TIME
                            Text(
                              getCheckInTime(entity.checkIn, entity.status),
                              //formattedTime(widget.entity.checkIn),
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Row(
                          children: [
                            //CHECK OUT ICON
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                //CUSTOMIZED CHECK OUT ICON
                                //CHECK OUT ICON BORDER COLOR
                                border: Border.all(
                                  color: _getCheckOutIconBorderColor(
                                    entity.status,
                                    entity.checkOut,
                                    entity.checkIn,
                                  ),
                                ),
                                //CHECK OUT ICON BACKGROUND COLOR
                                color: _getCheckOutIconBackgroundColor(
                                  entity.status,
                                  entity.checkIn,
                                  entity.checkOut,
                                ),
                              ),
                              child: SvgPicture.asset(
                                "packages/shared_resources/assets/icons/check_out.svg",
                                width: 40,
                                height: 40,
                                colorFilter: ColorFilter.mode(
                                  //CHECK OUT ICON COLOR
                                  _getCheckOutIconColor(
                                    entity.status,
                                    entity.checkIn,
                                    entity.checkOut,
                                  ),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            //DISPLAY CHECK OUT TIME
                            Text(
                              (_isSameTime(entity.checkIn, entity.checkOut) &&
                                      _isSameDay(
                                        entity.checkIn,
                                        DateTime.now(),
                                      ))
                                  ? "" //DONT DISPLAY TODAY PENDING CHECK OUT TIME
                                  : getCheckOutTime(
                                      entity.checkOut,
                                      entity.status,
                                    ),
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //GET CHECK IN TIME TEXT
  String getCheckInTime(DateTime checkIn, AttendanceStatus status) {
    return AttendanceStatus.leave == status
        ? "0.00 am"
        : formattedTime(checkIn);
  }

  //GET CHECK OUT TIME TEXT
  String getCheckOutTime(DateTime checkOut, AttendanceStatus status) {
    return AttendanceStatus.leave == status
        ? "0.00 pm"
        : formattedTime(checkOut);
  }

  //COMPARE 2 DATETIME OBJECTS FOR DATES
  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  //COMPARE 2 DATETIME OBJECTS FOR TIME
  bool _isSameTime(DateTime a, DateTime b) {
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day &&
        a.hour == b.hour &&
        a.minute == b.minute;
  }

  //STATUS AS A STRING
  String statusString(AttendanceStatus status) {
    String strnStatus = "Pending";
    if (status == AttendanceStatus.ontime) {
      strnStatus = "On Time";
    } else if (status == AttendanceStatus.late) {
      strnStatus = "Late";
    } else if (status == AttendanceStatus.leave) {
      strnStatus = "Leave";
    }
    return strnStatus;
  }

  //TODAY TEXT
  Widget todayText(var entity) {
    Widget widget = Text("data");
    DateFormat dateFormat = DateFormat("d MMMM yyyy");

    if (entity != null) {
      final checkIn = entity.checkIn;

      //CHECK IT IS TODAY
      if (_isSameDay(checkIn, DateTime.now())) {
        widget = Text(
          "Today",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black,
          ),
        );
      } else {
        widget = Text(
          dateFormat.format(checkIn),
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.black,
          ),
        );
      }
    }
    return widget;
  }

  //FORMAT TIME
  String formattedTime(DateTime value) {
    return DateFormat("hh.mm a").format(value).toLowerCase();
  }

  //CHECK OUT ICON COLOR
  Color _getDetailCardBorderColor(AttendanceStatus status, DateTime checkIn) {
    //TODAY
    if (_isSameDay(checkIn, DateTime.now()) &&
        AttendanceStatus.pending != status) {
      return AppColors.blue0085FF;
    } else {
      //OLD RECORDS
      switch (status) {
        case AttendanceStatus.ontime:
          return AppColors.blue0085FF;
        case AttendanceStatus.late:
          return AppColors.pinkE40079;
        case AttendanceStatus.leave:
          return AppColors.grey3F3D56;
        default:
          return Colors.transparent;
      }
    }
  }

  //STATUS BACKGROUND COLOR
  Color _getStatusBackgroundColor(AttendanceStatus status) {
    if (AttendanceStatus.ontime == status) {
      return AppColors.blue0085FF;
    } else if (AttendanceStatus.late == status) {
      return AppColors.pinkF8A8AB;
    } else if (AttendanceStatus.leave == status) {
      return AppColors.grey3F3D56;
    } else {
      return AppColors.white;
    }
  }

  //STATUS FONT COLOR
  Color _getStatusFontColor(AttendanceStatus status) {
    if (AttendanceStatus.late == status) {
      return AppColors.red;
    } else {
      return AppColors.white;
    }
  }

  //CHECK IN ICON
  Color _getCheckInIconBorderColor(AttendanceStatus status, DateTime checkIn) {
    //TODAY RECORD
    if (_isSameDay(checkIn, DateTime.now())) {
      return AppColors.blue0085FF;
    }
    //OLD RECORDS
    switch (status) {
      case AttendanceStatus.ontime:
        return AppColors.blue0085FF;
      case AttendanceStatus.late:
        return AppColors.pinkFF000463;
      case AttendanceStatus.leave:
        return AppColors.grey3F3D56;
      default:
        return Colors.transparent;
    }
  }

  //CHECK IN ICON BACKGROUND COLOR
  Color _getCheckInIconBackgroundColor(DateTime checkIn) {
    //TODAY
    if (_isSameDay(checkIn, DateTime.now())) {
      return AppColors.blue0085FF;
    } else {
      //OLD RECORDS
      return AppColors.white;
    }
  }

  //CHECK IN ICON COLOR
  Color _getCheckInIconColor(AttendanceStatus status, DateTime checkIn) {
    //TODAY
    if (_isSameDay(checkIn, DateTime.now())) {
      return AppColors.white;
    }
    //OLD RECORDS
    switch (status) {
      case AttendanceStatus.ontime:
        return AppColors.blue0085FF;
      case AttendanceStatus.late:
        return AppColors.pinkFF000463;
      case AttendanceStatus.leave:
        return AppColors.grey3F3D56;
      default:
        return Colors.transparent;
    }
  }

  //CHECK OUT ICON
  Color _getCheckOutIconBorderColor(
    AttendanceStatus status,
    DateTime checkOut,
    DateTime checkIn,
  ) {
    //TODAY
    if (_isSameDay(checkIn, DateTime.now()) &&
        AttendanceStatus.pending != status) {
      //CHECK OUT PENDING
      if (_isSameDay(checkIn, checkOut)) {
        return AppColors.greyD9D9D9;
      } else {
        //CHECKED OUT
        return AppColors.blue0085FF;
      }
    } else {
      //OLD RECORDS
      switch (status) {
        case AttendanceStatus.ontime:
          return AppColors.blue0085FF;
        case AttendanceStatus.late:
          return Colors.transparent;
        case AttendanceStatus.leave:
          return AppColors.grey3F3D56;
        default:
          return Colors.transparent;
      }
    }
  }

  //CHECK OUT ICON BACKGROUND COLOR
  Color _getCheckOutIconBackgroundColor(
    AttendanceStatus status,
    DateTime checkOut,
    DateTime checkIn,
  ) {
    //TODAY
    if (_isSameDay(checkIn, DateTime.now()) &&
        AttendanceStatus.pending != status) {
      //CHECK OUT PENDING
      if (_isSameDay(checkIn, checkOut)) {
        return AppColors.greyD9D9D9;
      } else {
        //CHECKED OUT
        return AppColors.blue0085FF;
      }
    } else {
      //OLD RECORDS
      return AppColors.white;
    }
  }

  //CHECK OUT ICON COLOR
  Color _getCheckOutIconColor(
    AttendanceStatus status,
    DateTime checkOut,
    DateTime checkIn,
  ) {
    //TODAY
    if (_isSameDay(checkIn, DateTime.now()) &&
        AttendanceStatus.pending != status) {
      return AppColors.white;
    } else {
      //OLD RECORDS
      switch (status) {
        case AttendanceStatus.ontime:
          return AppColors.blue0085FF;
        case AttendanceStatus.late:
          return AppColors.blue0085FF;
        case AttendanceStatus.leave:
          return AppColors.grey3F3D56;
        default:
          return Colors.transparent;
      }
    }
  }
}
