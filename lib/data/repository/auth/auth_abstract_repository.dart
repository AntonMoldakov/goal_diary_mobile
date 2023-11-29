import 'dart:async';

import 'package:goal_diary/data/repository/auth/dto/dto.dart';

abstract class AuthAbstractRepository {
  FutureOr<SignInResponseDto> signIn(SignInRequestDto signInDto);
}