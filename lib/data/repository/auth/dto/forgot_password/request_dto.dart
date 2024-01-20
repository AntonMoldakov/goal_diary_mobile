import 'package:equatable/equatable.dart';

class ForgotPasswordRequestDto extends Equatable {
  const ForgotPasswordRequestDto({
    required this.email,
  });

  final String email;

  @override
  List<Object> get props => [email];

  Map<String, dynamic>? toJson() {
    return {
      'email': email,
    };
  }
}
