import 'package:get_it/get_it.dart';
import 'package:goal_diary/data/repository/auth/auth_abstract_repository.dart';
import 'package:goal_diary/data/repository/auth/dto/sign_in/sign_in.dart';
import 'package:goal_diary/domain/state/auth/event.dart';
import 'package:goal_diary/domain/state/auth/state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with HydratedMixin {
  AuthBloc(this.authRepository) : super(const AuthState(accessToken: null)) {
    on<SignInEvent>(_onSignIn);
  }

  final AuthAbstractRepository authRepository;

  Future<void> _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final response = await authRepository.signIn(
          SignInRequestDto(email: event.email, password: event.password));

      emit(state.copyWith(accessToken: response.accessToken));
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState(
      accessToken: json['accessToken'] as String?,
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return {
      'accessToken': state.accessToken,
    };
  }
}
