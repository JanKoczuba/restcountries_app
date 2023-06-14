import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_country_details_response.g.dart';

@JsonSerializable()
class GetCountryDetailsResponse extends Equatable {
  const GetCountryDetailsResponse({
    required this.fullName,
    required this.currencies,
    required this.coatOfArms,
    required this.maps,
    required this.population,
    required this.timezones,
    required this.continents,
  });

  @JsonKey(name: 'name')
  final GetCountryFullName fullName;
  final GetCurrenciesName currencies;
  final GetCoatOfArms coatOfArms;
  final GetGoogleMapsUrl maps;
  final int population;
  final List<String> timezones;
  final List<String> continents;

  factory GetCountryDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCountryDetailsResponseFromJson(json);

  @override
  List<Object?> get props => [
        fullName,
        currencies,
        coatOfArms,
        maps,
        population,
        timezones,
        continents,
      ];
}

@JsonSerializable()
class GetCountryFullName extends Equatable {
  const GetCountryFullName({
    required this.official,
  });

  final String official;

  factory GetCountryFullName.fromJson(Map<String, dynamic> json) =>
      _$GetCountryFullNameFromJson(json);

  @override
  List<Object?> get props => [
        official,
      ];
}

@JsonSerializable()
class GetCoatOfArms extends Equatable {
  const GetCoatOfArms({
    required this.png,
  });

  final String? png;

  factory GetCoatOfArms.fromJson(Map<String, dynamic> json) =>
      _$GetCoatOfArmsFromJson(json);

  @override
  List<Object?> get props => [
        png,
      ];
}

@JsonSerializable()
class GetCurrenciesName extends Equatable {
  const GetCurrenciesName({
    required this.currencies,
    required this.symbol,
  });

  final String? currencies;
  final String? symbol;

  factory GetCurrenciesName.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const GetCurrenciesName(
        currencies: null,
        symbol: null,
      );
    }
    final key = json.keys.first;
    final currencyJson = json[key];

    return GetCurrenciesName(
      currencies: currencyJson['name'],
      symbol: currencyJson['symbol'],
    );
  }

  @override
  List<Object?> get props => [
        currencies,
        symbol,
      ];
}

@JsonSerializable()
class GetGoogleMapsUrl extends Equatable {
  const GetGoogleMapsUrl({
    required this.googleMaps,
  });

  final String googleMaps;

  factory GetGoogleMapsUrl.fromJson(Map<String, dynamic> json) =>
      _$GetGoogleMapsUrlFromJson(json);

  @override
  List<Object?> get props => [
        googleMaps,
      ];
}
