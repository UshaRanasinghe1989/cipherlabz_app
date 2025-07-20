abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
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
