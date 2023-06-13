import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_countries_response.g.dart';

@JsonSerializable()
class GetCountriesResponse extends Equatable {
  const GetCountriesResponse({
    required this.name,
    required this.capital,
    required this.flag,
  });

  final GetCapitalName name;
  final List<String> capital;
  final String flag;

  factory GetCountriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCountriesResponseFromJson(json);

  @override
  List<Object?> get props => [
        name,
        capital,
        flag,
      ];
}

@JsonSerializable()
class GetCapitalName extends Equatable {
  const GetCapitalName({
    required this.common,
  });

  final String common;

  factory GetCapitalName.fromJson(Map<String, dynamic> json) =>
      _$GetCapitalNameFromJson(json);

  @override
  List<Object?> get props => [
        common,
      ];
}
