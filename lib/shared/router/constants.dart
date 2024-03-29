enum AppRoute { home, welcome, signIn, signUp, confirmEmail, forgotPassword }

extension AppRouteExtension on AppRoute {
  String get toPath {
    switch (this) {
      case AppRoute.welcome:
        return '/welcome';
      case AppRoute.signIn:
        return '/sign-in';
      case AppRoute.signUp:
        return '/sign-up';
      case AppRoute.confirmEmail:
        return '/confirm-email';
      case AppRoute.forgotPassword:
        return '/forgot-password';
      case AppRoute.home:
      default:
        return '/home';
    }
  }

  String get toName {
    switch (this) {
      case AppRoute.welcome:
        return 'WELCOME';
      case AppRoute.signIn:
        return 'SIGN_IN';
      case AppRoute.signUp:
        return 'SIGN_UP';
      case AppRoute.forgotPassword:
        return 'FORGOT_PASSWORD';
      case AppRoute.confirmEmail:
        return 'CONFIRM_EMAIL';
      case AppRoute.home:
      default:
        return 'HOME';
    }
  }

  bool get toIsPrivate {
    switch (this) {
      case AppRoute.welcome:
        return false;
      case AppRoute.signIn:
        return false;
      case AppRoute.signUp:
        return false;
      case AppRoute.forgotPassword:
        return false;
      case AppRoute.confirmEmail:
        return false;
      case AppRoute.home:
      default:
        return true;
    }
  }
}
