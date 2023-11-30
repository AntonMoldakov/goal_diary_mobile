import 'package:go_router/go_router.dart';
import 'package:goal_diary/presentation/home.dart';
import 'package:goal_diary/presentation/sign_in.dart';
import 'package:goal_diary/presentation/sign_up.dart';
import 'package:goal_diary/presentation/welcome.dart';
import 'package:goal_diary/shared/router/app_route.dart';

class CustomRouterConfig {
  final bool isAuthenticated;

  CustomRouterConfig(this.isAuthenticated);

  get routerConfig => GoRouter(
        debugLogDiagnostics: true,
        initialLocation: AppRoute.welcome.toPath,
        redirect: (context, state) {
          AppRoute currentRoute = AppRoute.values
              .where((route) => route.toPath == state.fullPath)
              .first;

          if (isAuthenticated && !currentRoute.toIsPrivate) {
            return AppRoute.home.toPath;
          }

          if (!isAuthenticated && currentRoute.toIsPrivate) {
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
            path: AppRoute.home.toPath,
            name: AppRoute.home.toName,
            builder: (context, state) => Home(),
          ),
        ],
      );
}
