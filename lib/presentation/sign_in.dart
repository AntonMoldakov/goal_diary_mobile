import 'package:flutter/material.dart';
import 'package:goal_diary/shared/ui/ui.dart';

class SignIn extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                            text: 'SignIn',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w700)),
                      ],
                    )),
              ]))),
    );
  }
}
