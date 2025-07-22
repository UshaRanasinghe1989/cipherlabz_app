abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class GeneralFailure extends Failure {
  GeneralFailure({required super.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}

class NullFailure extends Failure {
  NullFailure({required super.errorMessage});
}

class LocationPermissionFailure extends Failure {
  LocationPermissionFailure({required super.errorMessage});
}

class LocationFailure extends Failure {
  LocationFailure({required super.errorMessage});
}

class LocalDataSourceFailuer extends Failure {
  LocalDataSourceFailuer({required super.errorMessage});
}

class DatabaseFailure extends Failure {
  DatabaseFailure({required super.errorMessage});
}

class AuthFailure extends Failure {
  AuthFailure({required super.errorMessage});
}

class DuplicateAttendanceFailure extends Failure {
  DuplicateAttendanceFailure({required super.errorMessage});
}
