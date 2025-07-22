class ServerException implements Exception {}

class CacheException implements Exception {}

class LocalDataSourceException implements Exception {
  final String message;
  LocalDataSourceException(this.message);
}
