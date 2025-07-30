import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_package/user_package.dart';

final userProvider = NotifierProvider<UserNotifier, UserState>(
  () => UserNotifier(),
);
