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
  });

  @JsonKey(name: 'name')
  final GetCountryFullName fullName;
  final GetCurrenciesName currencies;
  final GetCoatOfArms coatOfArms;
  final GetGoogleMapsUrl maps;
  final int population;

  factory GetCountryDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCountryDetailsResponseFromJson(json);

  @override
  List<Object?> get props => [
        fullName,
        currencies,
        coatOfArms,
        maps,
        population,
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

  final String png;

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
  });

  final List<String> currencies;

  factory GetCurrenciesName.fromJson(Map<String, dynamic> json) {
    final currencies = json.keys.map((key) => json[key]['name'].toString()).toList();
    return GetCurrenciesName(currencies: currencies);
  }

  @override
  List<Object?> get props => [
        currencies,
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
