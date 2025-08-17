//CASUAL LEAVE MODEL => ENTITY
import 'package:user_package/user_package.dart';

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      category: category,
      email: email,
      loginId: loginId,
      name: name,
      jobRole: jobRole,
      password: password,
    );
  }
}

extension UserEntityMapper on UserEntity {
  UserModel toModel() {
    return UserModel(
      id: id,
      category: category,
      email: email,
      loginId: loginId,
      name: name,
      jobRole: jobRole,
      password: password,
    );
  }
}
