import 'package:leave_package/leave_package.dart';
import 'package:user_package/user_package.dart';

class LeaveRequestWithUserModel {
  final UserModel userModel;
  final LeaveRequestEntity leaveRequestEntity;

  LeaveRequestWithUserModel({
    required this.userModel,
    required this.leaveRequestEntity,
  });
}
