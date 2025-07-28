import 'package:core/helpers/get_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationProvider = Provider<GetCurrentLoaction>((ref) {
  return GetCurrentLoaction();
});
