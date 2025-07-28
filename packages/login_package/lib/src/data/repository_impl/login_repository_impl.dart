import 'package:core/errors/failure.dart';
import 'package:core/params/params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_package/login_package.dart';
import 'package:login_package/src/data/datasource/login_datasource.dart';
import 'package:user_package/src/business/entity/user_entity.dart';
import 'package:user_package/user_package.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl({required this.datasource});

  //USER LOGIN
  @override
  Future<Either<Failure?, UserEntity?>> userLogin({
    required UserParams params,
  }) async {
    return await datasource.userLogin(params: params);
  }
}

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final dataSource = ref.read(loginDataSourceProvider);
  return LoginRepositoryImpl(datasource: dataSource);
});
