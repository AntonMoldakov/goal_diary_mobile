import 'package:go_router/go_router.dart';
import 'package:goal_diary/presentation/home.dart';
import 'package:goal_diary/presentation/welcome.dart';
import 'package:goal_diary/shared/router/app_route.dart';

final routerConfig = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: AppRoute.welcome.toPath,
  redirect: (context, state) {
    bool isAuthenticated = false;

    bool isCurrentScreenLogin = state.fullPath == AppRoute.welcome.toPath;

    // ignore: dead_code
    if (isAuthenticated && isCurrentScreenLogin) {
      return AppRoute.home.toPath;
    }

    if (!isAuthenticated) {
      return AppRoute.welcome.toPath;
    }
    // ignore: dead_code
    return null;
  },
  routes: [
    GoRoute(
      path: AppRoute.welcome.toPath,
      name: AppRoute.welcome.toName,
      builder: (context, state) => Welcome(),
    ),
    GoRoute(
      path: AppRoute.home.toPath,
      name: AppRoute.home.toName,
      builder: (context, state) => Home(),
    ),
  ],
);
