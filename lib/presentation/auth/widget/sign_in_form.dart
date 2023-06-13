import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../application/validators.dart';
import '../../../router/app_router.gr.dart';
import '../../../utils/context_extension.dart';
import '../../core/app_text_form_field.dart';
import '../../core/button/base_button.dart';
import '../../core/failure_snackbar_handler.dart';
import '../provider/auth_provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  var _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    context.read<AuthProvider>().addListener(() {
      final provider = context.read<AuthProvider>();
      final failure = provider.failure;
      final isAuthorized = provider.isAuthorized;
      if (failure.isSome()) {
        failure.forEach((failure) {
          FailureSnackBarHandler.handleFailure(
            context: context,
            failure: failure,
          );
        });
      }
      if (isAuthorized) {
        context.read<AuthProvider>().removeListener;
        context.router.replace(const CountriesRoute());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, authProvider, child) {
        final isLoading = context.read<AuthProvider>().isLoading;

        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                AppTextFormField(
                  key: const ValueKey("EmailInputField"),
                  initialValue: context.read<AuthProvider>().email,
                  onChanged: (value) =>
                      context.read<AuthProvider>().email = value,
                  validator: Validators.validEmail(context),
                ),
                const SizedBox(height: 16),
                AppTextFormField(
                  key: const ValueKey("PasswordInputField"),
                  initialValue: context.read<AuthProvider>().password,
                  onChanged: (value) =>
                      context.read<AuthProvider>().password = value,
                  validator: Validators.notEmpty(context),
                  obscureText: true,
                ),
                const SizedBox(height: 80),
                BaseButton(
                    onPressed: () {
                      final isValid = _formKey.currentState!.validate();
                      if (!isValid) {
                        _autovalidateMode = AutovalidateMode.onUserInteraction;
                        return;
                      }
                      context.read<AuthProvider>().login();
                    },
                    child: Text(
                      context.localizations.signInPagelogin,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
