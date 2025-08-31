import 'package:attendance_package/attendance_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/application/providers/leave_repository_provider.dart';
import 'package:user_package/user_package.dart';
import 'package:user_profile_package/user_profile_package.dart';

final userProfileReportRepositoryProvider = Provider<UserProfileRepository>((
  ref,
) {
  final userRepo = ref.read(userRepositoryProvider);
  final attendanceRepo = ref.read(attendanceRepositoryProvider);
  final leaveRepo = ref.read(leaveRepositoryProvider);

  return UserProfileRepositoryImpl(
    userRepo: userRepo,
    attendanceRepo: attendanceRepo,
    leaveRepo: leaveRepo,
  );
});
