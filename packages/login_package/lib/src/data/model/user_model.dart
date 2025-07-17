import 'package:login_package/src/business/entity/user_entity.dart';
import 'package:login_package/src/enum/user_category.dart';

class UserModel extends UserEntity {
  const UserModel({
    required int id,
    required String email,
    required String name,
    required UserCategory category,
    required String loginId,
    required String password,
  }) : super(
         id: id,
         email: email,
         name: name,
         category: category,
         loginId: loginId,
         password: password,
       );

  factory UserModel.fromJson(Map<int, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      category: json['category'],
      loginId: json['loginId'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'category': category,
      'loginId': loginId,
      'password': password,
    };
  }
}
