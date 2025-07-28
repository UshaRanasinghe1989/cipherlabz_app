import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_package/user_package.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dataSource = ref.read(userDataSourceProvider);
  return UserRepositoryImpl(datasource: dataSource);
});
