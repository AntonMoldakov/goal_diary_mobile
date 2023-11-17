import 'package:flutter/cupertino.dart';
import 'package:goal_diary/shared/ui/app_text/app_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: CupertinoButton.filled(
          onPressed: onPressed,
          child: AppText(
            text: text,
            style: TextStyle(fontSize: 20),
          ),
        ));
  }
}
