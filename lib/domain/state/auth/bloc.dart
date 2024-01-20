import 'package:get_it/get_it.dart';
import 'package:goal_diary/data/repository/auth/auth_abstract_repository.dart';
import 'package:goal_diary/data/repository/auth/dto/dto.dart';
import 'package:goal_diary/domain/state/auth/event.dart';
import 'package:goal_diary/domain/state/auth/state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with HydratedMixin {
  AuthBloc(this.authRepository) : super(const AuthState()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<ForgotPasswordEvent>(_forgotPassword);
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
      emit(const AuthStateLoading());
      final response = await authRepository.signIn(
          SignInRequestDto(email: event.email, password: event.password));

      emit(AuthStateLogged(response.accessToken));
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
      emit(AuthStateLoadingFailure(e.toString()));
    }
  }

  Future<void> _onSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthStateLoading());

      await authRepository.signUp(
          SignUpRequestDto(email: event.email, password: event.password));
      GetIt.instance<Talker>().log(event.email);

      emit(AuthStateCodeSentToEmail(event.email));
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
      emit(AuthStateLoadingFailure(e.toString()));
    }
  }

  Future<void> _forgotPassword(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthStateLoading());

      await authRepository.forgotPassword(ForgotPasswordRequestDto(
        email: event.email,
      ));
      GetIt.instance<Talker>().log(event.email);

      emit(AuthStateCodeSentToEmail(event.email));
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
      emit(AuthStateLoadingFailure(e.toString()));
    }
  }

  Future<void> _confirmEmail(
    ConfirmEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthStateLoading());

      final response = await authRepository.confirmEmail(
          ConfirmEmailRequestDto(email: event.email, code: event.code));

      emit(AuthStateLogged(response.accessToken));
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
      emit(AuthStateLoadingFailure(e.toString()));
      emit(AuthStateCodeSentToEmail(event.email));
    }
  }

  Future<void> _resendCode(
    ResendCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthStateLoading());

      await authRepository.resendCode(ResendCodeRequestDto(email: event.email));

      emit(AuthStateCodeSentToEmail(event.email));
    } catch (e, stack) {
      GetIt.instance<Talker>().handle(e, stack);
      emit(AuthStateLoadingFailure(e.toString()));
      emit(AuthStateCodeSentToEmail(event.email));
    }
  }

  Future<void> _onSignOut(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    await HydratedBloc.storage.clear();
    emit(const AuthState());
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    final accessToken = json['accessToken'] as String?;

    if (accessToken != null && accessToken.isNotEmpty) {
      return AuthStateLogged(
        accessToken,
      );
    }

    return AuthState();
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthStateLogged) {
      return {
        'accessToken': state.accessToken,
      };
    } else {
      return null;
    }
  }
}
