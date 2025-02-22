class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException({required this.message, required this.statusCode});
}

class OfflineException implements Exception {}
class VendorsException implements Exception {}

class OnEmptyCacheException implements Exception {}

class OtpException implements Exception {}

class UserException implements Exception {}

class UserEmailException implements Exception {}
class UserEmailNotFoundException implements Exception {}

class UserPhoneException implements Exception {}
