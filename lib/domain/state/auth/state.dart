import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
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
  const AuthStateLogged(this.accessToken);

  final String accessToken;

  @override
  List<Object?> get props => super.props..add(accessToken);
}
