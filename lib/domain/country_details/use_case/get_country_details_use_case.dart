import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure.dart';
import '../entity/country_deatils.dart';
import '../repository/country_details_repository.dart';

@injectable
class GetCountryDetailsUseCase {
  final CountryDetailsRepository _countryDetailsRepository;

  GetCountryDetailsUseCase(
    this._countryDetailsRepository,
  );

  Future<Either<Failure, CountryDetails>> execute(String countryName) =>
      _countryDetailsRepository.getCountryDetails(countryName);
}
