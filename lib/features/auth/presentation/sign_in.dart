import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_diary/features/auth/domain/state/auth/auth.dart';
import 'package:goal_diary/shared/helpers/form_validation_builder.dart';
import 'package:goal_diary/shared/router/constants.dart';
import 'package:goal_diary/shared/services/toaster.dart';
import 'package:goal_diary/shared/ui/ui.dart';

class SignIn extends StatefulWidget {
  @override
  createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.signInScreenTitle,
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthStateLoadingFailure) {
                    GetIt.instance<Toaster>()
                        .showToast(context, state.errorKey);
                  }
                },
                builder: (context, state) {
                  bool isLoading = state is AuthStateLoading;

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
                                    disabled: isLoading,
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
                                    disabled: isLoading,
                                    validator: (value) =>
                                        FormValidationBuilder(value, context)
                                            .required()
                                            .password()
                                            .build()),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                        .doNotHaveAccount),
                                    CustomTextButton(
                                      onPressed: () {
                                        context.push(AppRoute.signUp.toPath);
                                      },
                                      small: true,
                                      text:
                                          AppLocalizations.of(context)!.signUp,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CustomTextButton(
                                      onPressed: () {
                                        context.push(
                                            AppRoute.forgotPassword.toPath);
                                      },
                                      small: true,
                                      text: AppLocalizations.of(context)!
                                          .didYouForgetPassword,
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
                                  .signInScreenButton,
                              loading: isLoading,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final email = _emailController.text;
                                  final password = _passwordController.text;

                                  BlocProvider.of<AuthBloc>(context).add(
                                      SignInEvent(
                                          email: email, password: password));
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
