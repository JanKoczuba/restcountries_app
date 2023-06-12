import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../application/environment_config.dart';

const mainDioName = "mainDio";
const baseUrlName = "baseUrl";


@module
abstract class NetworkModule {
  @Named(baseUrlName)
  @LazySingleton()
  String provideBaseUrl() => EnvironmentConfig.baseUrl;

  @LazySingleton()
  @Named(mainDioName)
  Dio provideMainDio(
      @Named(baseUrlName) String baseUrl,
      PrettyDioLogger logInterceptor,
  ) {
    final mainDio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    if (kDebugMode) {
      mainDio.interceptors.add(logInterceptor);
    }

    return mainDio;
  }

  @LazySingleton()
  PrettyDioLogger provideLogInterceptor() {
    return PrettyDioLogger();
  }
}
