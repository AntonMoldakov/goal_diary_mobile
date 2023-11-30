import 'package:flutter/material.dart';
import 'package:goal_diary/shared/ui/app_text/app_text.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool disabled;
  final bool loading;
  final bool small;

  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.disabled = false,
    this.loading = false,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 16, horizontal: 8))),
        onPressed: disabled || loading ? null : onPressed,
        child: loading
            ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2.0),
                child: const CircularProgressIndicator(
                  // TODO: move to theme
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : AppText(
                text: text,
                style: TextStyle(fontSize: small ? 14 : 20),
              ));
  }
}
