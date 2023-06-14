import 'package:flutter/material.dart';

import '../../resource/app_text_style.dart';

class Section extends StatelessWidget {
  const Section({
    required this.header,
    required this.widget,
    this.icon,
    Key? key,
  }) : super(key: key);

  final String header;
  final Icon? icon;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            if (icon != null) icon,
            Text(
              '$header:',
              style: AppTextStyle.countryDetailsHeader,
            ),
          ],
        ),
        const SizedBox(height: 12),
        widget
      ],
    );
  }
}
