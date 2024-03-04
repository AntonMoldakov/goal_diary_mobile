import 'package:flutter/material.dart';
import 'package:goal_diary/shared/ui/ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText(
        text: title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      leading: leading,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
