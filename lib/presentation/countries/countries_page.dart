import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../di/di.dart';
import '../resource/app_pading.dart';
import 'provider/countries_provider.dart';
import 'widget/countries.dart';

@RoutePage()
class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (BuildContext context) => getIt<CountriesProvider>()..getData(),
          child: const Padding(
            padding: AppPadding.page,
            child: Countries(),
          ),
        ),
      ),
    );
  }
}
