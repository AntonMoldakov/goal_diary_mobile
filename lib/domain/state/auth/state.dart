import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String? accessToken;
  final String? email;
  final bool isLoading;

  const AuthState({
    this.accessToken,
    this.email,
    this.isLoading = false,
  });

  AuthState copyWith({
    String? accessToken,
    String? email,
    bool? isLoading,
  }) =>
      AuthState(
        accessToken: accessToken,
        email: email,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [accessToken, email, isLoading];
}
