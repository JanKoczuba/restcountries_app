import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/get_country_details_response.dart';

part 'country_details_api.g.dart';

@RestApi()
abstract class CountryDetailsApi {
  factory CountryDetailsApi(Dio dio) = _CountryDetailsApi;

  @GET("name/{country}")
  Future<List<GetCountryDetailsResponse>> getCountryDetails({
    @Path("country") required String country,

  });
}
