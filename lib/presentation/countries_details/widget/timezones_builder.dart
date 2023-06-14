import 'package:flutter/material.dart';

import '../../../utils/context_extension.dart';
import '../../resource/app_text_style.dart';
import 'section.dart';

class TimezonesBuilder extends StatelessWidget {
  const TimezonesBuilder({
    required this.timezones,
    Key? key,
  }) : super(key: key);

  final List<String> timezones;

  @override
  Widget build(BuildContext context) {
    return Section(
      header: context.localizations.countryDetailsTimezones,
      widget: ListView.builder(
        itemCount: timezones.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final timezone = timezones[index];
          return Text(
            timezone,
            style: AppTextStyle.countryDetailsBody,
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
