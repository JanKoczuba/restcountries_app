import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/app.dart';

Future<void> mainCommon() async {
  await _lockPortraitOrientation();
  runApp(const App());
}

Future<void> _lockPortraitOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
