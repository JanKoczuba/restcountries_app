import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure.dart';
import '../entity/country.dart';
import '../repository/countries_repository.dart';

@injectable
class GetCountriesUseCase {
  final CountriesRepository _countriesRepository;

  GetCountriesUseCase(
    this._countriesRepository,
  );

  Future<Either<Failure, List<Country>>> execute() =>
      _countriesRepository.getCountries();
}
