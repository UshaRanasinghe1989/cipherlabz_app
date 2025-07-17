import 'package:login_package/src/data/model/user_model.dart';

abstract class UserLocalDataSource {
  Future<void>? cacheUser(UserModel? userToCache);

  Future<UserModel> getLastUser();
}
