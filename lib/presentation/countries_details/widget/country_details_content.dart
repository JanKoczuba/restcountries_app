import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/context_extension.dart';
import '../../core/default_error_widget.dart';
import '../../resource/app_text_style.dart';
import '../provider/country_details_provider.dart';
import 'continents_builder.dart';
import 'currency_builder.dart';
import 'google_maps_launch_builder.dart';
import 'section.dart';
import 'timezones_builder.dart';

class CountryDetailsContent extends StatelessWidget {
  const CountryDetailsContent({
    required this.country,
    Key? key,
  }) : super(key: key);

  final String country;

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryDetailsProvider>(builder: (_, authProvider, child) {
      final isLoading = context.read<CountryDetailsProvider>().isLoading;

      if (isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      final countryDetails =
          context.read<CountryDetailsProvider>().countryDetails;
      return countryDetails.fold(
        () => Center(
          child: DefaultErrorWidget(
              onRefresh: () =>
                  context.read<CountryDetailsProvider>().getData(country)),
        ),
        (countyDetails) => SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Text(
                countyDetails.fullName,
                style: AppTextStyle.countryDetailsFullName,
              ),
              if (countyDetails.coatOfArms != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Image.network(countyDetails.coatOfArms ?? ''),
                ),
              GoogleMapsLaunchBuilder(
                url: countyDetails.googleMaps,
              ),
              CurrencyBuilder(
                currency: countyDetails.currency,
              ),
              ContinentsBuilder(
                continents: countyDetails.continents,
              ),
              Section(
                header: context.localizations.countryDetailsPopulation,
                widget: Text(
                  '${countyDetails.population}',
                  style: AppTextStyle.countryDetailsBody,
                  textAlign: TextAlign.center,
                ),
              ),
              TimezonesBuilder(
                timezones: countyDetails.timezones,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      );
    });
  }
}
