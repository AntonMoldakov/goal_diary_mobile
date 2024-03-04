import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitState extends AuthState {
  const AuthInitState();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateLoaded extends AuthState {
  const AuthStateLoaded();
}

class AuthStateLoadingFailure extends AuthState {
  const AuthStateLoadingFailure(this.errorKey);

  final String errorKey;

  @override
  List<Object?> get props => super.props..add(errorKey);
}

class AuthStateCodeSentToEmail extends AuthState {
  const AuthStateCodeSentToEmail(this.email);

  final String email;

  @override
  List<Object?> get props => super.props..add(email);
}

class AuthStateLogged extends AuthState {
  const AuthStateLogged();
}

class AuthStateLoggedAsGuest extends AuthState {
  const AuthStateLoggedAsGuest();
}
