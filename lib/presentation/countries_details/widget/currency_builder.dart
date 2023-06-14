import 'package:flutter/material.dart';

import '../../../domain/country_details/entity/currency.dart';
import '../../../utils/context_extension.dart';
import '../../resource/app_text_style.dart';
import 'section.dart';

class CurrencyBuilder extends StatelessWidget {
  const CurrencyBuilder({
    required this.currency,
    Key? key,
  }) : super(key: key);

  final Currency? currency;

  @override
  Widget build(BuildContext context) {
    final currency = this.currency;
    if (currency == null) {
      return const SizedBox();
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        Section(
          header: context.localizations.countryDetailsCurrencies,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currency.currencies,
                style: AppTextStyle.countryDetailsBody,
              ),
              Text(
                '[${currency.currenciesSymbol}]',
                style: AppTextStyle.countryDetailsBody,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
