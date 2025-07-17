import 'package:core/params/params.dart';
import 'package:login_package/src/data/model/user_model.dart';

abstract class UserRemoteDatasource {
  Future<UserModel> getUser({required UserParams UserParams});
}
