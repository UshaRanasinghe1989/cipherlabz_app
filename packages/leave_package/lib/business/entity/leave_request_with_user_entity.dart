import 'package:leave_package/leave_package.dart';
import 'package:user_package/user_package.dart';

class LeaveRequestWithUserEntity {
  final UserEntity userEntity;
  final LeaveRequestEntity leaveRequestEntity;

  LeaveRequestWithUserEntity({
    required this.userEntity,
    required this.leaveRequestEntity,
  });
}
