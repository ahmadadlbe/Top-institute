import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final String message;
  final int statusCode;
  ServerFailure({required this.message, required this.statusCode});
  @override
  List<Object?> get props => [message,statusCode];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class OTPFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class VendorFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UserFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UserEmailFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class UserEmailNotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UserPhoneFailure extends Failure {
  @override
  List<Object?> get props => [];
}
