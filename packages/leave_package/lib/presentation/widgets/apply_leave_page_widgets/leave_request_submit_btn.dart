import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//APP COLORS
import 'package:color_package/color_package.dart';
import 'package:leave_package/application/providers/leave_provider.dart';
import 'package:leave_package/leave_package.dart';
import 'package:logger/web.dart';
//PROVIDERS
import 'package:login_package/src/application/providers/login_provider.dart';

class LeaveRequestSubmitBtn extends ConsumerWidget {
  final Logger logger = Logger();

  final GlobalKey<FormState> formKey;
  final String leaveType;
  final TextEditingController fromDate, toDate;
  final TextEditingController? reason;
  final AttachmentEntity? attachment;

  LeaveRequestSubmitBtn({
    super.key,
    required this.formKey,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    this.reason,
    this.attachment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    if (loginState.user == null) {
      // User is not logged in or user data not loaded yet
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User not logged in. Please login first.")),
      );
    }
    final userId = loginState.user!.id;

    final leaveState = ref.watch(leaveProvider);
    final leaveNotifier = ref.read(leaveProvider.notifier);
    return Padding(
      //SIGN IN BUTTON
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: TextButton(
        onPressed: () async {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          if (formKey.currentState!.validate()) {
            logger.i(userId);
            logger.i(_getLeaveType(leaveType));
            logger.i(DateTime.parse(fromDate.text));
            logger.i(DateTime.parse(toDate.text));
            logger.i(reason?.text);
            try {
              await leaveNotifier.saveLeaveRequest(
                userId: userId,
                leaveType: _getLeaveType(leaveType),
                fromDate: DateTime.parse(fromDate.text),
                toDate: DateTime.parse(toDate.text),
                reason: reason?.text,
                attachment: attachment,
              );
              leaveState.isLoading
                  ? CircularProgressIndicator()
                  : ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Success!")));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyLeavePage()),
              );
            } on Exception catch (e) {
              print("Error: $e");
            }
          } else {
            return;
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.blue0085FF,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
            side: BorderSide(color: AppColors.blue0085FF), //#0085FF
          ),
        ),
        child: Text("Submit", style: TextStyle(color: AppColors.white)),
      ),
    );
  }

  LeaveTypes _getLeaveType(String leaveType) {
    switch (leaveType.toUpperCase()) {
      case "CASUAL LEAVE":
        return LeaveTypes.casual;
      case "ANNUAL LEAVE":
        return LeaveTypes.annual;
      default:
        return LeaveTypes.casual;
    }
  }
}
