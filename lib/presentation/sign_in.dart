import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:goal_diary/shared/ui/ui.dart';

class SignIn extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CustomNavigationBar(
        title: AppLocalizations.of(context)!.signInScreenTitle,
      ),
      child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Form(
                  onChanged: () {
                    print("change");
                  },
                  child: Column(children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomTextField(placeholder: "Email"),
                            SizedBox(height: 16),
                            CustomTextField(placeholder: "Password"),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                              text: AppLocalizations.of(context)!
                                  .signInScreenButton,
                              onPressed: () {
                                print("click");
                              },
                            )
                          ],
                        ))
                  ])))),
    );
  }
}
