import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/get_countries_response.dart';

part 'countries_api.g.dart';

@RestApi()
abstract class CountriesApi {
  factory CountriesApi(Dio dio) = _CountriesApi;

  @GET("all?fields=name,flag,capital")
  Future<List<GetCountriesResponse>> getCountries();
}
