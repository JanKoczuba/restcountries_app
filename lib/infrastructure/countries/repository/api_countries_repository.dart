import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/countries/entity/country.dart';
import '../../../domain/countries/repository/countries_repository.dart';
import '../../core/service/base_api_service.dart';
import '../api/countries_api.dart';

@Injectable(as: CountriesRepository)
class ApiCountriesRepository extends BaseApiService
    implements CountriesRepository {
  final CountriesApi _api;

  ApiCountriesRepository(
    this._api,
  );

  @override
  Future<Either<Failure, List<Country>>> getCountries() => makeRequest(
        () async {
          final countriesResponse = await _api.getCountries();
          return right(countriesResponse
              .map((country) => Country(
                    name: country.name.common,
                    flag: country.flag,
                    capital: country.capital,
                  ))
              .toList());
        },
      );
}
