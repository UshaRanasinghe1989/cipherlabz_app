import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:login_package/login_package.dart';
import 'package:user_package/user_package.dart';
import 'package:user_profile_package/user_profile_package.dart';

class UserProfileReportAsyncNotifier
    extends AutoDisposeAsyncNotifier<UserWithReport> {
  final logger = Logger();

  late final UserProfileReportsUsecases userProfileReportUseCases = ref.read(
    userProfileReportsUseCasesProvider,
  );

  @override
  Future<UserWithReport> build() async {
    //final user = await ref.watch(userAsyncNotifierProvider.future);
    final loginState = ref.watch(loginProvider);
    final user = loginState.user;
    logger.i("User : ${user!.name}");

    if (user == null) {
      logger.i("User not loaded yet");
      // you can return an empty report or throw an error depending on your logic
      throw Exception("User not loaded yet");
    }

    final today = DateTime.now();
    final result = await userProfileReportUseCases.getUserProfileReportsUseCase
        .call(DatetimeHelpers.getDateOnly(today));

    return UserWithReport(user: user, report: result);
  }
}
