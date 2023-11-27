import 'package:flutter/material.dart';
import 'package:goal_diary/shared/ui/app_text/app_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool disabled;
  final bool loading;

  const CustomButton({
    required this.onPressed,
    required this.text,
    this.disabled = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: FilledButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 16))),
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
                  style: TextStyle(fontSize: 20),
                ),
        ));
  }
}
