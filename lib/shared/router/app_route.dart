enum AppRoute { home, welcome }

extension AppRouteExtension on AppRoute {
  String get toPath {
    switch (this) {
      case AppRoute.welcome:
        return '/welcome';
      case AppRoute.home:
      default:
        return '/home';
    }
  }

  String get toName {
    switch (this) {
      case AppRoute.welcome:
        return 'WELCOME';
      case AppRoute.home:
      default:
        return 'HOME';
    }
  }

  String get toTitle {
    switch (this) {
      case AppRoute.welcome:
        return 'Welcome';
      case AppRoute.home:
      default:
        return 'My App';
    }
  }
}
