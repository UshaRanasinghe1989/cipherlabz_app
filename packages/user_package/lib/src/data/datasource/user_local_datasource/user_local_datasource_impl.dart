import 'dart:convert';

import 'package:core/errors/exceptions.dart';
import 'package:user_package/src/data/datasource/user_local_datasource/user_local_datasource.dart';
import 'package:user_package/src/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedUser = 'CACHED_USER';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void>? cacheUser(userToCache) async {
    if (userToCache != null) {
      sharedPreferences.setString(
        cachedUser,
        json.encode(userToCache.toJson()),
      );
    }
    throw CacheException();
  }

  @override
  Future<UserModel> getLastUser() {
    final jsonString = sharedPreferences.getString(cachedUser);

    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    }
    throw CacheException();
  }
}
