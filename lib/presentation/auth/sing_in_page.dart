import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../di/di.dart';
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
          child: const Padding(
            padding: AppPadding.page,
            child: SignInForm(),
          ),
        ),
      ),
    );
  }
}
