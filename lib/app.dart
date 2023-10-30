import 'package:flutter/cupertino.dart';
import 'package:goal_diary/shared/router/router_config.dart';
import 'package:goal_diary/shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      title: 'Goal Diary',
      theme: lightTheme,
      routerConfig: routerConfig,
    );
  }
}
