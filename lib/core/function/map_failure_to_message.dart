import '../error/failure.dart';
import '../strings/failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case const (ServerFailure):
      final serverFailure = failure as ServerFailure;
      return serverFailure.message;
    case const (OTPFailure):
      return FailureMessages.otpNotverification;
    case const (OfflineFailure):
      return FailureMessages.noInternet;
    default:
      return FailureMessages.unexpected;
  }
}