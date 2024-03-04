import 'package:equatable/equatable.dart';

class ConfirmEmailRequestDto extends Equatable {
  const ConfirmEmailRequestDto({
    required this.email,
    required this.code,
  });

  final String email;
  final int code;

  @override
  List<Object> get props => [email, code];

  Map<String, dynamic>? toJson() {
    return {
      'email': email,
      'code': code,
    };
  }
}
