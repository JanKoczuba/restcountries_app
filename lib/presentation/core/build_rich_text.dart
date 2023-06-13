import 'package:flutter/material.dart';

class BuildRichText extends StatelessWidget {
  const BuildRichText({
    required this.text,
    required this.text2,
    required this.textStyle,
    required this.text2Style,
    Key? key,
  }) : super(key: key);

  final String text;
  final String text2;
  final TextStyle textStyle;
  final TextStyle text2Style;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: text, style: textStyle),
          TextSpan(text: text2, style: text2Style),
        ],
      ),
    );
  }
}
