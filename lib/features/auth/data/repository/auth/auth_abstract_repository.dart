import 'dart:async';

import 'package:goal_diary/features/auth/data/repository/auth/dto/dto.dart';

abstract class AuthAbstractRepository {
  FutureOr<SignInResponseDto> signIn(SignInRequestDto signInDto);

  FutureOr signUp(SignUpRequestDto signUpDto);

  FutureOr<ConfirmEmailResponseDto> confirmEmail(
      ConfirmEmailRequestDto confirmEmailDto);

  FutureOr resendCode(ResendCodeRequestDto resendCodeDto);

  FutureOr forgotPassword(ForgotPasswordRequestDto forgotPasswordRequestDto);
}
