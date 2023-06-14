import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../core/api/network_module.dart';
import 'api/country_details_api.dart';

@module
abstract class CountryDetailsModule {
  @lazySingleton
  CountryDetailsApi provideCountryDetailsApi(
      @Named(mainDioName) Dio dio,
      ) {
    return CountryDetailsApi(dio);
  }
}
