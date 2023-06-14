import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  const Currency({
    required this.currencies,
    required this.currenciesSymbol,
  });

  final String currencies;
  final String currenciesSymbol;

  @override
  List<Object?> get props => [
        currencies,
        currenciesSymbol,
      ];
}
