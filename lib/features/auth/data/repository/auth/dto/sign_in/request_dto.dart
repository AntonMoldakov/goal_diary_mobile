import 'package:equatable/equatable.dart';

class SignInRequestDto extends Equatable {
  const SignInRequestDto({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  Map<String, dynamic>? toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
