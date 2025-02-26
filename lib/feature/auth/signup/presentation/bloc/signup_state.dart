import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignupState {}

final class SignUpLoading extends SignupState {}

final class SignUpSuccess extends SignupState {
  final String messageSuccess;

  const SignUpSuccess({required this.messageSuccess});

  @override
  List<Object> get props => [messageSuccess];
}

final class SignUpFaliure extends SignupState {
  final String messagError;

  const SignUpFaliure({required this.messagError});
  @override
  List<Object> get props => [messagError];
}
