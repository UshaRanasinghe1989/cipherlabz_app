import 'package:core/errors/exceptions.dart';
import 'package:core/params/params.dart';
import 'package:login_package/src/data/datasource/user_remote_datasource/user_remote_datasource.dart';
import 'package:login_package/src/data/model/user_model.dart';

class UserRemoteDatasourceImpl /*implements UserRemoteDatasource*/ {
  // final Dio dio;

  // UserRemoteDataSourceImpl({required this.dio});

  // @override
  // Future<UserModel> getUser({required UserParams UserParams}) async {
  //ToDO:
  //   final response = await dio.get(
  //     //'https://pokeapi.co/api/v2/pokemon/${params.id}',
  //     queryParameters: {'api_key': 'if you need'},
  //   );

  //   if (response.statusCode == 200) {
  //     return UserModel.fromJson(response.data);
  //   } else {
  //     throw ServerException();
  //   }
  // }
}
