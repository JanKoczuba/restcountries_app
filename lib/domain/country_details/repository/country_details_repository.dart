import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entity/country_deatils.dart';

abstract class CountryDetailsRepository {
  Future<Either<Failure, CountryDetails>> getCountryDetails(String countryName);
}
