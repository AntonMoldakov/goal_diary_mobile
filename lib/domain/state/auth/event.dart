import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitEvent extends AuthEvent {
  const AuthInitEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  const SignUpEvent({required this.email, required this.password});
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;

  const ForgotPasswordEvent({required this.email});
}

class ConfirmEmailEvent extends AuthEvent {
  final String email;
  final int code;

  const ConfirmEmailEvent({required this.email, required this.code});
}

class ResendCodeEvent extends AuthEvent {
  final String email;

  const ResendCodeEvent({required this.email});
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}
