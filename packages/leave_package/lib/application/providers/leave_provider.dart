import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/application/notifiers/leave_notifier.dart';
import 'package:leave_package/presentation/state/leave_state.dart';

final leaveProvider = NotifierProvider<LeaveNotifier, LeaveState>(
  () => LeaveNotifier(),
);
