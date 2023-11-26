import 'package:flutter/material.dart';
import 'package:goal_diary/shared/ui/app_text/app_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool disabled;

  const CustomButton({
    required this.onPressed,
    required this.text,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: FilledButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 16))),
          onPressed: disabled ? null : onPressed,
          child: AppText(
            text: text,
            style: TextStyle(fontSize: 20),
          ),
        ));
  }
}
