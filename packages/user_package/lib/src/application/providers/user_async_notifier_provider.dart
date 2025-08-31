import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_package/user_package.dart';

final userAsyncNotifierProvider =
    AsyncNotifierProvider<UserAsyncNotifier, UserEntity>(UserAsyncNotifier.new);
