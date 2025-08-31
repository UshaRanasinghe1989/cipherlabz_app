import 'package:user_package/user_package.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.category,
    required super.loginId,
    required super.jobRole,
    required super.department,
    required super.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      category: json['category'],
      loginId: json['loginId'],
      jobRole: json['jobRole'],
      department: json['department'],
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
      'jobRole': jobRole,
      'department': department,
      'password': password,
    };
  }
}
