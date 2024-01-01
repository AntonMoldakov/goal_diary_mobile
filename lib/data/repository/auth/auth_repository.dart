// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/data/repository/auth/auth_abstract_repository.dart';
import 'package:goal_diary/data/repository/auth/dto/dto.dart';
import 'package:goal_diary/shared/constants/constants.dart';
import 'package:goal_diary/shared/services/api.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthRepository implements AuthAbstractRepository {
  AuthRepository({
    required this.api,
  });

  final ApiClient api;

  @override
  FutureOr<SignInResponseDto> signIn(SignInRequestDto signInRequestDto) async {
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
  FutureOr signUp(SignUpRequestDto signUpRequestDto) async {
    try {
      await api.post('/v1/auth/sign-up', data: signUpRequestDto.toJson());
    } on DioError catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
      String errorKey =
          e.response?.data?.key?.toString() ?? somethingWentWrongKey;
      throw Exception(errorKey);
    }
  }

  @override
  FutureOr<ConfirmEmailResponseDto> confirmEmail(
      ConfirmEmailRequestDto confirmEmailRequestDto) async {
    try {
      final response = await api.post('/v1/auth/confirm-email',
          data: confirmEmailRequestDto.toJson());
      final data = response.data as Map<String, dynamic>;

      return ConfirmEmailResponseDto(accessToken: data['accessToken']);
    } on DioError catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
      String errorKey =
          e.response?.data?.key?.toString() ?? somethingWentWrongKey;
      throw Exception(errorKey);
    }
  }

  @override
  FutureOr resendCode(ResendCodeRequestDto resendCodeRequestDto) async {
    try {
      await api.post('/v1/auth/resend-code',
          data: resendCodeRequestDto.toJson());
    } on DioError catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
      String errorKey =
          e.response?.data?.key?.toString() ?? somethingWentWrongKey;
      throw Exception(errorKey);
    }
  }
}
