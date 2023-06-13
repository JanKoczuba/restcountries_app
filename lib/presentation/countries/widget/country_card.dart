import 'package:flutter/material.dart';

import '../../../domain/countries/entity/country.dart';
import '../../../utils/context_extension.dart';
import '../../core/build_rich_text.dart';
import '../../resource/app_color.dart';
import '../../resource/app_pading.dart';
import '../../resource/app_text_style.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    required this.country,
    Key? key,
  }) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.commentCardBackground,
      elevation: 0,
      child: Padding(
        padding: AppPadding.cardMargin,
        child: Column(
          children: [
            BuildRichText(
              text: '${context.localizations.countryCountry}: ',
              text2: '${country.name} ${country.flag}',
              textStyle: AppTextStyle.countryHeader,
              text2Style: AppTextStyle.countryName,
            ),
            const SizedBox(height: 4),
            if (country.capital.isNotEmpty)
              BuildRichText(
              text: '${context.localizations.countryCapital}: ',
              text2: country.capital.first,
              textStyle: AppTextStyle.countryHeader,
              text2Style: AppTextStyle.countryCapital,
            ),
          ],
        ),
      ),
    );
  }
}
