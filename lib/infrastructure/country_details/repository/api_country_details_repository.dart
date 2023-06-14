import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/country_details/entity/country_deatils.dart';
import '../../../domain/country_details/repository/country_details_repository.dart';
import '../../core/service/base_api_service.dart';
import '../api/country_details_api.dart';

@Injectable(as: CountryDetailsRepository)
class ApiCountryDetailsRepository extends BaseApiService
    implements CountryDetailsRepository {
  final CountryDetailsApi _api;

  ApiCountryDetailsRepository(
    this._api,
  );

  @override
  Future<Either<Failure, CountryDetails>> getCountryDetails(String country) =>
      makeRequest(
        () async {
          final result = await _api.getCountryDetails(country: country);
          if (result.isNotEmpty) {
            final response = result.first;
            return right(CountryDetails(
              fullName: response.fullName.official,
              currencies: response.currencies.currencies,
              coatOfArms: response.coatOfArms.png,
              googleMaps: response.maps.googleMaps,
              population: response.population,
            ));
          }
          return left(const Failure.invalidResponse());
        },
      );
}
