import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_diary/domain/state/auth/auth.dart';
import 'package:goal_diary/shared/router/router_config.dart';
import 'package:goal_diary/shared/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MaterialApp.router(
          onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
          theme: lightTheme,
          routerConfig:
              CustomRouterConfig(state.accessToken != null).routerConfig,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
