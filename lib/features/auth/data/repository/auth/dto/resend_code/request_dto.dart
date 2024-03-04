import 'package:equatable/equatable.dart';

class ResendCodeRequestDto extends Equatable {
  const ResendCodeRequestDto({
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
