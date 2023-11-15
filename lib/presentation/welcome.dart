import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/shared/ui/ui.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Welcome extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.welcomeScreenTitle,
                textAlign: TextAlign.center,
              ),
              CustomButton(
                child: AppText(text: 'Welcome'),
                onPressed: () {
                  GetIt.I<Talker>().debug('Click');
                },
              )
            ],
          )),
    );
  }
}
