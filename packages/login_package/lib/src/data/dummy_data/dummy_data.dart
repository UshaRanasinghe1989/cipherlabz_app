import 'package:login_package/src/business/entity/user_entity.dart';
import 'package:login_package/src/enum/user_category.dart';

//USERS SET
class UserSet {
  static final Set<UserEntity> usersSet = {
    UserEntity(
      id: 0,
      email: "sunil@gmail.com",
      name: "Sunil Perera",
      category: UserCategory.superUser,
      loginId: "sunil@gmail.com",
      password: "test",
    ),
    UserEntity(
      id: 1,
      email: "nimal@gmail.com",
      name: "Nimal Fernando",
      category: UserCategory.regularUser,
      loginId: "nimal@gmail.com",
      password: "test",
    ),
    UserEntity(
      id: 2,
      email: "charith@gmail.com",
      name: "Charith Fernando",
      category: UserCategory.regularUser,
      loginId: "charith@gmail.com",
      password: "test",
    ),
  };
}
