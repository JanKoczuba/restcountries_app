import 'package:equatable/equatable.dart';

import 'currency.dart';

class CountryDetails extends Equatable {
  const CountryDetails({
    required this.fullName,
    required this.currency,
    required this.coatOfArms,
    required this.googleMaps,
    required this.population,
    required this.timezones,
    required this.continents,
  });

  final String fullName;
  final Currency? currency;
  final String? coatOfArms;
  final String googleMaps;
  final int population;
  final List<String> timezones;
  final List<String> continents;

  @override
  List<Object?> get props => [
        fullName,
        currency,
        coatOfArms,
        googleMaps,
        population,
        timezones,
        continents,
      ];
}
