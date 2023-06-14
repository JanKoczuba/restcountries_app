import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../di/di.dart';
import '../resource/app_pading.dart';
import 'provider/country_details_provider.dart';
import 'widget/country_details_content.dart';

@RoutePage()
class CountryDetailsPage extends StatefulWidget {
  const CountryDetailsPage({
    required this.country,
    Key? key,
  }) : super(key: key);

  final String country;

  @override
  State<CountryDetailsPage> createState() => _CountryDetailsPageState();
}

class _CountryDetailsPageState extends State<CountryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (BuildContext context) =>
              getIt<CountryDetailsProvider>()..getData(widget.country),
          child: Padding(
            padding: AppPadding.page,
            child: CountryDetailsContent(
              country: widget.country,
            ),
          ),
        ),
      ),
    );
  }
}
