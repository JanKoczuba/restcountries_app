import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('AuthPage'),
      ),
    );
  }
}
