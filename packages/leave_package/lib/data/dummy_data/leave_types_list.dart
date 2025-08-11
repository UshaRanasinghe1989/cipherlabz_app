import 'package:leave_package/business/enums/leave_types.dart';

class LeaveTypesList {
  static List<LeaveTypesClass> list = [
    LeaveTypesClass(
      leaveTypes: LeaveTypes.annual,
      leaveTypeString: "Annual Leave",
    ),
    LeaveTypesClass(
      leaveTypes: LeaveTypes.casual,
      leaveTypeString: "Casual Leave",
    ),
  ];
}

class LeaveTypesClass {
  final LeaveTypes leaveTypes;
  final String leaveTypeString;

  LeaveTypesClass({required this.leaveTypes, required this.leaveTypeString});
}
