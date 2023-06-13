import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entity/country.dart';

abstract class CountriesRepository {
  Future<Either<Failure, List<Country>>> getCountries();
}
