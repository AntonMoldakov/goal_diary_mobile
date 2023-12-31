enum AppRoute { home, welcome, signIn }

extension AppRouteExtension on AppRoute {
  String get toPath {
    switch (this) {
      case AppRoute.welcome:
        return '/welcome';
      case AppRoute.signIn:
        return '/sign-in';
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
      case AppRoute.home:
      default:
        return true;
    }
  }
}
