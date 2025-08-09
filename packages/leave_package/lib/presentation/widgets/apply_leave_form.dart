import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:leave_package/leave_package.dart';

class ApplyLeaveForm extends StatefulWidget {
  const ApplyLeaveForm({super.key});

  @override
  State<ApplyLeaveForm> createState() => _ApplyLeaveFormState();
}

class _ApplyLeaveFormState extends State<ApplyLeaveForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fromDate = TextEditingController();
  final TextEditingController _toDate = TextEditingController();
  final TextEditingController _reason = TextEditingController();

  // Track the selected leave type here
  String selectedLeaveType = "Leave Type";

  @override
  void dispose() {
    _fromDate.dispose();
    _toDate.dispose();
    _reason.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blue0085FF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black00000040,
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset.zero,
            ),
            BoxShadow(
              color: AppColors.white,
              blurRadius: 0,
              spreadRadius: 0,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TEXT - Leave Request
              Text(
                "Leave Request",
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              //LABEL - LEAVE TYPE
              _inputFieldLabelTextSpan("Leave Type"),
              //DROP DOWN LIST - LEAVE TYPES
              LeaveTypesDropDownList(
                onChanged: (value) {
                  setState(() {
                    selectedLeaveType = value;
                  });
                },
                selectedValue: selectedLeaveType,
              ),
              SizedBox(height: 10),
              //LABEL - From Date
              _inputFieldLabelTextSpan("From Date"),
              //ENTER FROM DATE
              DatePickerWithTextFieldState(
                controller: _fromDate,
                customHintText: "MM/DD/YYYY",
                msg: "Please enter from date !",
              ),
              SizedBox(height: 10),
              //LABEL - To Date
              _inputFieldLabelTextSpan("To Date"),
              //ENTER TO DATE
              DatePickerWithTextFieldState(
                controller: _toDate,
                customHintText: "MM/DD/YYYY",
                msg: "Please enter to date !",
              ),
              SizedBox(height: 10),
              //LABEL - Reason
              Text(
                "Reason",
                style: TextStyle(
                  color: AppColors.grey3F3D56E3,
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //ENTER REASON
              TextField(
                controller: _reason,
                maxLines: 2, // Allows unlimited lines
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.blue0085FF),
                  ),
                  alignLabelWithHint: true, // Align label to top when multiline
                ),
              ),
              SizedBox(height: 10),
              //ATTACHMENT BUTTON
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    padding: EdgeInsets.symmetric(),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.blue0085FF),
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  onPressed: () => print("pressed"),
                  label: Text(
                    "Attachment",
                    style: TextStyle(color: AppColors.grey6F6F6F),
                  ),
                  icon: Icon(Icons.attach_file, color: AppColors.grey3F3D56),
                ),
              ),
              SizedBox(height: 10),
              //SUBMIT / CANCEL BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SUBMIT BUTTON
                  LeaveRequestSubmitBtn(
                    formKey: _formKey,
                    leaveType: selectedLeaveType,
                    fromDate: _fromDate,
                    toDate: _toDate,
                    reason: _reason,
                  ),
                  SizedBox(width: 5),
                  //CANCEL BUTTON
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        side: BorderSide(color: AppColors.grey7C7A82), //#7C7A82
                      ),
                    ),
                    onPressed: () => print("Cancel btn pressed !"),
                    child: Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //LABEL WITH *
  Widget _inputFieldLabelTextSpan(String labelText) {
    return Text.rich(
      TextSpan(
        text: labelText,
        style: TextStyle(
          color: AppColors.grey3F3D56E3,
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: "*",
            style: TextStyle(
              color: AppColors.red,
              fontFamily: "Poppins",
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
