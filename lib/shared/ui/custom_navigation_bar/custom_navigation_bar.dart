import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goal_diary/shared/ui/ui.dart';

class CustomNavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;

  const CustomNavigationBar({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: AppText(
        text: title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      leading: leading,
      trailing: trailing,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
