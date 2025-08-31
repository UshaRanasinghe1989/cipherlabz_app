import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_package/user_profile_package.dart';

final userProfileAsyncNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      UserProfileReportAsyncNotifier,
      UserWithReport
    >(UserProfileReportAsyncNotifier.new);
