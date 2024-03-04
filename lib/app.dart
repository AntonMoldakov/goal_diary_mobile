import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/features/auth/data/repository/auth/auth_abstract_repository.dart';
import 'package:goal_diary/features/auth/domain/state/auth/auth.dart';
import 'package:goal_diary/shared/router/app_router.dart';
import 'package:goal_diary/shared/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: fix init page
    return BlocProvider<AuthBloc>(
        create: (context) =>
            AuthBloc(GetIt.I<AuthAbstractRepository>())..add(AuthInitEvent()),
        child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              AppRouter.router.refresh();
            },
            child: MaterialApp.router(
              onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
              theme: lightTheme,
              routerConfig: AppRouter.router,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            )));
  }
}
