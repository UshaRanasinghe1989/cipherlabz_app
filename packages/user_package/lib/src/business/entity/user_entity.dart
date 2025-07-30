import 'package:core/enum/user_category.dart';
import 'package:user_package/src/data/model/user_model.dart';

class UserEntity {
  final int id;
  final String email;
  final String name;
  final UserCategory category;
  final String loginId;
  final String password;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.category,
    required this.loginId,
    required this.password,
  });

  //ENTITY => MODEL
  UserModel toModel() {
    return UserModel(
      id: id,
      email: email,
      name: name,
      category: category,
      loginId: loginId,
      password: password,
    );
  }

  //MODEL => ENTITY
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      name: name,
      category: category,
      loginId: loginId,
      password: password,
    );
  }
}
