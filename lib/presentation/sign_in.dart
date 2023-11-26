import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/domain/state/auth/auth.dart';
import 'package:goal_diary/shared/helpers/form_validator.dart';
import 'package:goal_diary/shared/ui/ui.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SignIn extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;
  bool _isFormLoading = false;
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
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Form(
                      key: _formKey,
                      onChanged: () => setState(() =>
                          _isFormValid = _formKey.currentState!.validate()),
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
                                    disabled: _isFormLoading,
                                    validator: (value) =>
                                        FormValidator(value, true, context)
                                            .emailValidationError),
                                SizedBox(height: 16),
                                PasswordTextField(
                                    controller: _passwordController,
                                    labelText: AppLocalizations.of(context)!
                                        .passwordField,
                                    disabled: _isFormLoading,
                                    validator: (value) => FormValidator(
                                          value,
                                          true,
                                          context,
                                        ).passwordValidationError),
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
                                  disabled: !_isFormValid || _isFormLoading,
                                  onPressed: () async {
                                    setState(() => _isFormLoading = true);

                                    if (_formKey.currentState!.validate()) {
                                      final email = _emailController.text;
                                      final password = _passwordController.text;

                                      // TODO: add loading state
                                      BlocProvider.of<AuthBloc>(context).add(
                                          SignInEvent(
                                              email: email,
                                              password: password));
                                    } else {
                                      GetIt.I<Talker>().debug('error');
                                    }

                                    setState(() => _isFormLoading = false);
                                  },
                                )
                              ],
                            ))
                      ]));
                },
              ))),
    );
  }
}
