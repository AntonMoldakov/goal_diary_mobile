import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String? accessToken;
  final bool isLoading;

  const AuthState({
    this.accessToken,
    this.isLoading = false,
  });

  AuthState copyWith({
    String? accessToken,
    bool? isLoading,
  }) =>
      AuthState(
        accessToken: accessToken,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [accessToken, isLoading];
}
