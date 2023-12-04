import 'package:get_it/get_it.dart';
import 'package:goal_diary/data/repository/auth/auth_abstract_repository.dart';
import 'package:goal_diary/data/repository/auth/dto/dto.dart';
import 'package:goal_diary/domain/state/auth/event.dart';
import 'package:goal_diary/domain/state/auth/state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with HydratedMixin {
  AuthBloc(this.authRepository) : super(const AuthState(accessToken: null)) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<SignOutEvent>(_onSignOut);
    on<ConfirmEmailEvent>(_confirmEmail);
    on<ResendCodeEvent>(_resendCode);
  }

  final AuthAbstractRepository authRepository;

  Future<void> _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final response = await authRepository.signIn(
          SignInRequestDto(email: event.email, password: event.password));

      emit(state.copyWith(accessToken: response.accessToken));
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      await authRepository.signUp(
          SignUpRequestDto(email: event.email, password: event.password));

      emit(state.copyWith(email: event.email));
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _confirmEmail(
    ConfirmEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      await authRepository.confirmEmail(
          ConfirmEmailRequestDto(email: event.email, code: event.code));
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _resendCode(
    ResendCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      await authRepository.resendCode(ResendCodeRequestDto(email: event.email));
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onSignOut(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) {
    try {
      emit(state.copyWith(accessToken: null));
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
