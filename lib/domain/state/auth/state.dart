import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String? accessToken;

  const AuthState({
    required this.accessToken,
  });

  AuthState copyWith({
    String? accessToken,
  }) =>
      AuthState(
        accessToken: accessToken ?? this.accessToken,
      );

  @override
  List<Object?> get props => [accessToken];
}
