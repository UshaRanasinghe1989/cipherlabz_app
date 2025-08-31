import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_package/user_package.dart';

class UserAsyncNotifier extends AsyncNotifier<UserEntity> {
  @override
  Future<UserEntity> build() async {
    // Access the state saved by login
    final userState = ref.watch(userProvider);

    if (userState.user == null) {
      throw Exception("User not logged in");
    }

    // return it (Riverpod wraps it into AsyncData automatically)
    return userState.user!;
  }
}
