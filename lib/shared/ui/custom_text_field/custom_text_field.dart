import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final IconData? prefixIcon;

  const CustomTextField({
    Key? key,
    this.controller,
    this.placeholder,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      prefix: Icon(prefixIcon),
      padding: EdgeInsets.symmetric(vertical: 16),
      style: TextStyle(fontSize: 20),
    );
  }
}
