import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../di/di.dart';
import '../../domain/auth/use_case/get_sessions_use_case.dart';
import '../../router/app_router.gr.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    getIt<GetSessionsUseCase>().execute().then((isFirstLogin) async {
      await isFirstLogin.fold((l) => _openPinSignInPage(),
          (hasLoginDataIsStorage) {
        if (hasLoginDataIsStorage) {
          return context.router.replace(const CountriesRoute());
        }
        return _openPinSignInPage();
      });
    });
  }

  Future<void> _openPinSignInPage() =>
      context.router.replace(const SignInRoute());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
