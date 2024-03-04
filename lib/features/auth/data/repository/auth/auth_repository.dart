// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:goal_diary/features/auth/data/repository/auth/auth_abstract_repository.dart';
import 'package:goal_diary/features/auth/data/repository/auth/dto/dto.dart';
import 'package:goal_diary/shared/constants/constants.dart';
import 'package:goal_diary/shared/services/api.dart';

class AuthRepository implements AuthAbstractRepository {
  AuthRepository({
    required this.api,
  });

  final ApiClient api;

  @override
  signIn(signInRequestDto) async {
    try {
      final response =
          await api.post('/v1/auth/sign-in', data: signInRequestDto.toJson());

      final data = response.data as Map<String, dynamic>;

      return SignInResponseDto(accessToken: data['accessToken']);
    } on DioError catch (e) {
      final data = e.response?.data;

      String errorKey = data?['key'] ?? somethingWentWrongKey;
      throw errorKey;
    }
  }

  @override
  signUp(signUpRequestDto) async {
    try {
      await api.post('/v1/auth/sign-up', data: signUpRequestDto.toJson());
    } on DioError catch (e) {
      final data = e.response?.data;

      String errorKey = data?['key'] ?? somethingWentWrongKey;
      throw errorKey;
    }
  }

  @override
  forgotPassword(forgotPasswordRequestDto) async {
    try {
      await api.post('/v1/auth/forgot-password',
          data: forgotPasswordRequestDto.toJson());
    } on DioError catch (e) {
      final data = e.response?.data;

      String errorKey = data?['key'] ?? somethingWentWrongKey;
      throw errorKey;
    }
  }

  @override
  confirmEmail(confirmEmailRequestDto) async {
    try {
      final response = await api.post('/v1/auth/confirm-email',
          data: confirmEmailRequestDto.toJson());
      final data = response.data as Map<String, dynamic>;

      return ConfirmEmailResponseDto(accessToken: data['accessToken']);
    } on DioError catch (e) {
      final data = e.response?.data;

      String errorKey = data?['key'] ?? somethingWentWrongKey;
      throw errorKey;
    }
  }

  @override
  resendCode(resendCodeRequestDto) async {
    try {
      await api.post('/v1/auth/resend-code',
          data: resendCodeRequestDto.toJson());
    } on DioError catch (e) {
      final data = e.response?.data;

      String errorKey = data?['key'] ?? somethingWentWrongKey;
      throw errorKey;
    }
  }
}
