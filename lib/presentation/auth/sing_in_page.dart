import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../di/di.dart';
import '../core/failure_snackbar_handler.dart';
import '../resource/app_pading.dart';
import 'provider/auth_provider.dart';
import 'widget/sign_in_form.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (BuildContext context) => getIt<AuthProvider>(),
          child: Padding(
            padding: AppPadding.page,
            child: Selector<AuthProvider, AuthProvider>(
              shouldRebuild: (previous, next) {
                return previous.failure != next.failure;
              },
              selector: (context, provider) => provider,
              builder: (context, provider, child) {
                if (provider.failure.isSome()) {
                  provider.failure.fold(
                    () => null,
                    (a) => FailureSnackBarHandler.handleFailure(
                      context: context,
                      failure: a,
                    ),
                  );
                }
                return const SignInForm();
              },
            ),
          ),
        ),
      ),
    );
  }
}
