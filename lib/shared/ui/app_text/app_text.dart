import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const AppText({
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
