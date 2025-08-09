import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:leave_package/business/enums/leave_types.dart';

class LeaveTypesDropDownList extends StatefulWidget {
  final String selectedValue;
  final ValueChanged<String> onChanged;

  LeaveTypesDropDownList({
    Key? key,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<LeaveTypesDropDownList> createState() => _LeaveTypesDropDownListState();
}

class _LeaveTypesDropDownListState extends State<LeaveTypesDropDownList> {
  @override
  Widget build(BuildContext context) {
    List<String> list = ["Leave Type", "Casual Leave", "Annual Leave"];

    return DropdownButtonFormField<String>(
      value: widget.selectedValue,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue0085FF), // Normal border
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue0085FF), // Focused border
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      items: list.map((value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (newValue) {
        if (newValue != null) {
          widget.onChanged(newValue);
        }
      },
    );
  }

  String _leaveTypeString(LeaveTypes type) {
    String typeString = type.toString().trim().split(
      '.',
    )[1]; //casual / annual / sick ....
    return typeString[0].toUpperCase() + typeString.substring(1) + " Leave";
  }
}
