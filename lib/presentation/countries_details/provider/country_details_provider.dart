import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/country_details/entity/country_deatils.dart';
import '../../../domain/country_details/use_case/get_country_details_use_case.dart';

@injectable
class CountryDetailsProvider with ChangeNotifier {
  CountryDetailsProvider(
    this._getCountryDetailsUseCase,
  );

  final GetCountryDetailsUseCase _getCountryDetailsUseCase;
  Option<Failure> _failure = none();
  Option<CountryDetails> _countryDetails = none();
  bool _isLoading = false;

  Option<Failure> get failure => _failure;

  Option<CountryDetails> get countryDetails => _countryDetails;

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

  set countryDetails(Option<CountryDetails> value) {
    if (_countryDetails == value) return;
    _countryDetails = value;
    notifyListeners();
  }

  void getData(String country) async {
    isLoading = true;
    failure = none();
    final result = await _getCountryDetailsUseCase.execute(country);
    result.fold(
      (l) {
        failure = some(l);
      },
      (r) {
        _countryDetails = some(r);
      },
    );
    isLoading = false;
    failure = none();
  }
}
