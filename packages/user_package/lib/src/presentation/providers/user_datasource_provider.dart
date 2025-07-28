import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_package/src/data/datasource/user_datasource.dart';

final userDataSourceProvider = Provider<UserDatasource>((ref) {
  return UserDatasource();
});
