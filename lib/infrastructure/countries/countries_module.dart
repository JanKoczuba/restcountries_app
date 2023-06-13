import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../core/api/network_module.dart';
import 'api/countries_api.dart';

@module
abstract class CountriesModule {
  @lazySingleton
  CountriesApi provideCommentsApi(
      @Named(mainDioName) Dio dio,
      ) {
    return CountriesApi(dio);
  }
}
