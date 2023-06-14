import 'package:flutter/material.dart';

import '../../../utils/context_extension.dart';
import '../../resource/app_text_style.dart';
import 'section.dart';

class ContinentsBuilder extends StatelessWidget {
  const ContinentsBuilder({
    required this.continents,
    Key? key,
  }) : super(key: key);

  final List<String> continents;

  @override
  Widget build(BuildContext context) {
    return Section(
      header: context.localizations.countryDetailsContinents,
      widget: ListView.builder(
        itemCount: continents.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final continent = continents[index];
          return Text(
            continent,
            style: AppTextStyle.countryDetailsBody,
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
