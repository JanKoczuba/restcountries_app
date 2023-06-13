import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


import '../../../domain/auth/entity/user_credentials.dart';
import '../../../domain/auth/use_case/login_use_case.dart';
import '../../../domain/core/failure.dart';

@injectable
class AuthProvider with ChangeNotifier {
  AuthProvider(
    this._loginUseCase,
  );

  final LoginUseCase _loginUseCase;
  Option<Failure> _failure = none();
  String _email = 'user@user.com';
  String _password = 'userPassword';
  bool _isLoading = false;
  bool _isAuthorized = false;

  Option<Failure> get failure => _failure;

  String get email => _email;

  String get password => _password;

  bool get isLoading => _isLoading;

  bool get isAuthorized => _isAuthorized;

  set failure(Option<Failure> value) {
    if (_failure == value) return;
    _failure = value;
    notifyListeners();
  }

  set email(String value) {
    if (_email == value) return;
    _email = value;
    notifyListeners();
  }

  set password(String value) {
    if (_password == value) return;
    _password = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    if (_isLoading == value) return;
    _isLoading = value;
    notifyListeners();
  }

  set isAuthorized(bool value) {
    if (_isAuthorized == value) return;
    _isAuthorized = value;
    notifyListeners();
  }

  void login() async {
    isLoading = true;
    failure = none();
    final result = await _loginUseCase.execute(UserCredentials(
      email: _email,
      password: _password,
    ));
    result.fold(
      (l) {
        isLoading = false;
        failure = some(l);
      },
      (r) {
        isLoading = false;
        isAuthorized = true;
      },
    );
    isLoading = false;
    failure = none();
  }
}
