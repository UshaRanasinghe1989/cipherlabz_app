import 'package:flutter_riverpod/flutter_riverpod.dart';
//PACKAGES
import 'package:login_package/login_package.dart';

final loginProvider = NotifierProvider<LoginNotifier, LoginState>(
  () => LoginNotifier(),
);
