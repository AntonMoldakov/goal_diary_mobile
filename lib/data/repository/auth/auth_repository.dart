import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:goal_diary/data/repository/auth/auth_abstract_repository.dart';
import 'package:goal_diary/data/repository/auth/dto/sign_in/request_dto.dart';
import 'package:goal_diary/data/repository/auth/dto/sign_in/response_dto.dart';
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
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
      throw Exception(e.toString());
    }
  }
}
