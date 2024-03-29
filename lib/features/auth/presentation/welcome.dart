import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_diary/features/auth/domain/state/auth/auth.dart';
import 'package:goal_diary/shared/router/constants.dart';
import 'package:goal_diary/shared/ui/ui.dart';

class Welcome extends StatelessWidget {
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppText(
                            text: AppLocalizations.of(context)!
                                .welcomeScreenTitle,
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w700)),
                        SizedBox(height: 16),
                        AppText(
                          text: AppLocalizations.of(context)!
                              .welcomeScreenSubtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                              text: AppLocalizations.of(context)!
                                  .welcomeScreenSignInButton,
                              onPressed: () {
                                context.push(AppRoute.signIn.toPath);
                              },
                            ),
                            SizedBox(height: 16),
                            CustomButton(
                              text: AppLocalizations.of(context)!
                                  .welcomeScreenSignInAsGuestButton,
                              onPressed: () {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthSignInAsGuestEvent());
                              },
                            )
                          ],
                        )))
              ]))),
    );
  }
}
