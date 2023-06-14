import 'package:equatable/equatable.dart';

class CountryDetails extends Equatable {
  const CountryDetails({
    required this.fullName,
    required this.currencies,
    required this.coatOfArms,
    required this.googleMaps,
    required this.population,
  });

  final String fullName;
  final List<String> currencies;
  final String coatOfArms;
  final String googleMaps;
  final int population;

  @override
  List<Object?> get props => [
        fullName,
        currencies,
        coatOfArms,
        googleMaps,
        population,
      ];
}
