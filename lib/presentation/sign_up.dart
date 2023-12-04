import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_diary/domain/state/auth/auth.dart';
import 'package:goal_diary/shared/helpers/form_validation_builder.dart';
import 'package:goal_diary/shared/router/app_route.dart';
import 'package:goal_diary/shared/ui/ui.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.signUpScreenTitle,
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Form(
                      key: _formKey,
                      child: Column(children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomTextField(
                                    controller: _emailController,
                                    labelText: AppLocalizations.of(context)!
                                        .emailField,
                                    disabled: state.isLoading,
                                    validator: (value) =>
                                        FormValidationBuilder(value, context)
                                            .required()
                                            .email()
                                            .build()),
                                SizedBox(height: 16),
                                PasswordTextField(
                                    controller: _passwordController,
                                    labelText: AppLocalizations.of(context)!
                                        .passwordField,
                                    disabled: state.isLoading,
                                    validator: (value) =>
                                        FormValidationBuilder(value, context)
                                            .required()
                                            .password()
                                            .build()),
                                SizedBox(height: 16),
                                PasswordTextField(
                                    controller: _confirmPasswordController,
                                    labelText: AppLocalizations.of(context)!
                                        .confirmPasswordField,
                                    disabled: state.isLoading,
                                    validator: (value) =>
                                        FormValidationBuilder(value, context)
                                            .required()
                                            .confirmPassword(
                                                _passwordController.text)
                                            .build()),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                        .haveAccount),
                                    CustomTextButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      small: true,
                                      text:
                                          AppLocalizations.of(context)!.signIn,
                                    )
                                  ],
                                )
                              ],
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                              text: AppLocalizations.of(context)!
                                  .signUpScreenButton,
                              loading: state.isLoading,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final email = _emailController.text;
                                  final password = _passwordController.text;

                                  BlocProvider.of<AuthBloc>(context).add(
                                      SignUpEvent(
                                          email: email, password: password));
// TODO: only on success
                                  context.push(AppRoute.confirmEmail.toPath);
                                } else {
                                  GetIt.I<Talker>().debug('error');
                                }
                              },
                            )
                          ],
                        )
                      ]));
                },
              ))),
    );
  }
}
