import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/countries/entity/country.dart';
import '../../../domain/countries/use_case/get_countries_use_case.dart';

@injectable
class CountriesProvider with ChangeNotifier {
  CountriesProvider(
    this._getCountriesUseCase,
  );

  final GetCountriesUseCase _getCountriesUseCase;
  Option<Failure> _failure = none();
  List<Country> _countries = [];
  bool _isLoading = false;

  Option<Failure> get failure => _failure;

  List<Country> get countries => _countries;

  bool get isLoading => _isLoading;

  set failure(Option<Failure> value) {
    if (_failure == value) return;
    _failure = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    if (_isLoading == value) return;
    _isLoading = value;
    notifyListeners();
  }

  set countries(List<Country> value) {
    if (listEquals(_countries, value)) return;
    _countries = value;
    notifyListeners();
  }

  void getData() async {
    isLoading = true;

    failure = none();
    final result = await _getCountriesUseCase.execute();
    result.fold(
      (l) {
        isLoading = false;
        failure = some(l);
      },
      (r) {
        countries = r;
        isLoading = false;
      },
    );
    isLoading = false;
    failure = none();
  }
}
