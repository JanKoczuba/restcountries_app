import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:injectable/injectable.dart';

import 'di/di.dart';
import 'main_common.dart' as app;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    name: Environment.dev,
    variables: {
      "baseUrl": "https://restcountries.com/v3.1/",
    },
  );
  await configureDependencies(environment: Environment.dev);
  await app.mainCommon();
}
