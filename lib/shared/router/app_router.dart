import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_diary/features/auth/domain/state/auth/bloc.dart';
import 'package:goal_diary/features/auth/domain/state/auth/state.dart';
import 'package:goal_diary/features/auth/presentation/confirm_email.dart';
import 'package:goal_diary/features/auth/presentation/forgot_password.dart';
import 'package:goal_diary/features/auth/presentation/home.dart';
import 'package:goal_diary/features/auth/presentation/sign_in.dart';
import 'package:goal_diary/features/auth/presentation/sign_up.dart';
import 'package:goal_diary/features/auth/presentation/welcome.dart';
import 'package:goal_diary/shared/router/app_route.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoute.welcome.toPath,
    redirect: (context, state) {
      final isLoggedIn = context.read<AuthBloc>().state is AuthStateLogged;
      final isLoggedInAsGuest =
          context.read<AuthBloc>().state is AuthStateLoggedAsGuest;

      bool isLoggedInAny = isLoggedIn || isLoggedInAsGuest;

      AppRoute currentRoute = AppRoute.values
          .where((route) => route.toPath == state.fullPath)
          .first;

      if (isLoggedInAny && !currentRoute.toIsPrivate) {
        return AppRoute.home.toPath;
      }

      if (!isLoggedInAny && currentRoute.toIsPrivate) {
        return AppRoute.welcome.toPath;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoute.welcome.toPath,
        name: AppRoute.welcome.toName,
        builder: (context, state) => Welcome(),
      ),
      GoRoute(
        path: AppRoute.signIn.toPath,
        name: AppRoute.signIn.toName,
        builder: (context, state) => SignIn(),
      ),
      GoRoute(
        path: AppRoute.signUp.toPath,
        name: AppRoute.signUp.toName,
        builder: (context, state) => SignUp(),
      ),
      GoRoute(
        path: AppRoute.forgotPassword.toPath,
        name: AppRoute.forgotPassword.toName,
        builder: (context, state) => ForgotPassword(),
      ),
      GoRoute(
        path: AppRoute.home.toPath,
        name: AppRoute.home.toName,
        builder: (context, state) => Home(),
      ),
      GoRoute(
        path: AppRoute.confirmEmail.toPath,
        name: AppRoute.confirmEmail.toName,
        builder: (context, state) => ConfirmEmail(),
      ),
    ],
  );
}
