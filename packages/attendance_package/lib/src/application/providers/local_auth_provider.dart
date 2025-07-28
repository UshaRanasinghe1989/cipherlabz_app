import 'package:core/helpers/local_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localAuthProvider = Provider<LocalAuth>((ref) {
  return LocalAuth();
});
