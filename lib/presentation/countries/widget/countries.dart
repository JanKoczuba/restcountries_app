import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../router/app_router.gr.dart';
import '../provider/countries_provider.dart';
import 'country_card.dart';

class Countries extends StatelessWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CountriesProvider>(
      builder: (_, authProvider, child) {
        final isLoading = context.read<CountriesProvider>().isLoading;

        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final countries = context.read<CountriesProvider>().countries;
        return SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return InkWell(
                  onTap: () => context.router.push(CountryDetailsRoute(
                    country: country.name,
                  )),
                  child: CountryCard(country: country),
                );
              }),
        );
      },
    );
  }
}
