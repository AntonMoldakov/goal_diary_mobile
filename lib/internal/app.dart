import 'package:flutter/material.dart';
import 'package:goal_diary/presentation/home.dart';
import 'package:goal_diary/shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goal Diary',
      theme: lightTheme,
      home: Home(),
    );
  }
}
