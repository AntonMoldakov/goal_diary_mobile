import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/features/auth/data/repository/auth/auth_abstract_repository.dart';
import 'package:goal_diary/features/auth/data/repository/auth/dto/dto.dart';
import 'package:goal_diary/features/auth/domain/state/auth/event.dart';
import 'package:goal_diary/features/auth/domain/state/auth/state.dart';
import 'package:goal_diary/shared/services/auth.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(const AuthState()) {
    on<AuthInitEvent>((_onAuthInitState));
    on<AuthSignInAsGuestEvent>((_onSignInAsGuest));
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<ForgotPasswordEvent>(_forgotPassword);
    on<SignOutEvent>(_onSignOut);
    on<ConfirmEmailEvent>(_confirmEmail);
    on<ResendCodeEvent>(_resendCode);
  }

  final AuthAbstractRepository authRepository;

  Future<void> _onAuthInitState(
    AuthInitEvent event,
    Emitter<AuthState> emit,
  ) async {
    bool isLoggedIn = GetIt.I<AuthService>().isLoggedIn;

    if (isLoggedIn) {
      emit(AuthStateLogged());
    }
  }

  Future<void> _onSignInAsGuest(
    AuthSignInAsGuestEvent event,
    Emitter<AuthState> emit,
  ) async {
    bool isLoggedIn = GetIt.I<AuthService>().isLoggedIn;

    if (isLoggedIn) {
      emit(AuthStateLoggedAsGuest());
    }
  }

  Future<void> _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthStateLoading());
      final response = await authRepository.signIn(
          SignInRequestDto(email: event.email, password: event.password));

      GetIt.I<AuthService>().login(response.accessToken);
      emit(AuthStateLogged());
    } catch (e, stack) {
      GetIt.I<Talker>().handle(e, stack);
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
      GetIt.I<Talker>().log(event.email);

      emit(AuthStateCodeSentToEmail(event.email));
    } catch (e, stack) {
      GetIt.I<Talker>().handle(e, stack);
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
      GetIt.I<Talker>().log(event.email);

      emit(AuthStateCodeSentToEmail(event.email));
    } catch (e, stack) {
      GetIt.I<Talker>().handle(e, stack);
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

      GetIt.I<AuthService>().login(response.accessToken);
      emit(AuthStateLogged());
    } catch (e, stack) {
      GetIt.I<Talker>().handle(e, stack);
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
      GetIt.I<Talker>().handle(e, stack);
      emit(AuthStateLoadingFailure(e.toString()));
      emit(AuthStateCodeSentToEmail(event.email));
    }
  }

  Future<void> _onSignOut(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    GetIt.I<AuthService>().logout();
    emit(const AuthState());
  }
}
