import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:goal_diary/domain/state/auth/auth.dart';
import 'package:goal_diary/shared/ui/ui.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const refetchDelay = 60;

class ConfirmEmail extends StatefulWidget {
  @override
  createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  StreamController<ErrorAnimationType>? errorAnimationController;

  bool hasError = false;

  late Timer _timer;
  int _start = refetchDelay;
  bool isLoading = true;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isLoading = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    errorAnimationController = StreamController<ErrorAnimationType>();

    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    errorAnimationController!.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.confirmEmailScreenTitle,
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Column(children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CodeTextField(
                              errorAnimationController:
                                  errorAnimationController,
                              labelText:
                                  AppLocalizations.of(context)!.codeField,
                              disabled: state.isLoading,
                              onCompleted: (code) => {
                                errorAnimationController!
                                    .add(ErrorAnimationType.shake),
                                BlocProvider.of<AuthBloc>(context).add(
                                    ConfirmEmailEvent(
                                        code: int.parse(code),
                                        email: state.email!))
                              },
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomTextButton(
                                    onPressed: () {
                                      setState(() {
                                        _start = refetchDelay;
                                        isLoading = true;
                                        startTimer();
                                      });

                                      BlocProvider.of<AuthBloc>(context).add(
                                          ResendCodeEvent(email: state.email!));
                                    },
                                    small: true,
                                    disabled: isLoading,
                                    text: isLoading
                                        ? AppLocalizations.of(context)!
                                            .resendIn(_start)
                                        : AppLocalizations.of(context)!
                                            .resendCode)
                              ],
                            )
                          ],
                        ))
                    // TODO: delete text
                  ]);
                },
              ))),
    );
  }
}
