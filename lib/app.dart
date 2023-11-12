import 'package:flutter/cupertino.dart';
import 'package:goal_diary/shared/router/router_config.dart';
import 'package:goal_diary/shared/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      theme: lightTheme,
      routerConfig: routerConfig,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
