part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String messageSuccess;

  const LoginSuccess({required this.messageSuccess});

  @override
  List<Object> get props => [messageSuccess];
}

final class LoginFaliure extends LoginState {
  final String messagError;

  const LoginFaliure({required this.messagError});
  @override
  List<Object> get props => [messagError];
}
