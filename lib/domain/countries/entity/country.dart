import 'package:equatable/equatable.dart';

class Country extends Equatable {
  const Country({
    required this.name,
    required this.flag,
    required this.capital,
  });

  final String name;
  final String flag;
  final List<String> capital;

  @override
  List<Object?> get props => [
        name,
        flag,
        capital,
      ];
}
