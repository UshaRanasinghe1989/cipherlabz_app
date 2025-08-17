import 'package:core/enum/user_category.dart';
import 'package:user_package/user_package.dart';

//USERS SET
class UserSet {
  static final Set<UserModel> usersSet = {
    UserModel(
      id: 0,
      email: "sunil@gmail.com",
      name: "Sunil Perera",
      category: UserCategory.superUser,
      loginId: "sunil@gmail.com",
      jobRole: "IT Support",
      password: "test",
    ),
    UserModel(
      id: 1,
      email: "nimal@gmail.com",
      name: "Nimal Fernando",
      category: UserCategory.regularUser,
      loginId: "nimal@gmail.com",
      jobRole: "Project Manager",
      password: "test",
    ),
    UserModel(
      id: 2,
      email: "charith@gmail.com",
      name: "Charith Fernando",
      category: UserCategory.regularUser,
      loginId: "charith@gmail.com",
      jobRole: "Software Engineer",
      password: "test",
    ),
  };
}
