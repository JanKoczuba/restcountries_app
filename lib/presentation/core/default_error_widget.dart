import 'package:flutter/material.dart';

import '../../utils/context_extension.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    required this.onRefresh,
    this.message,
    Key? key,
  }) : super(key: key);
  final String? message;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          message ?? context.localizations.defaultErrorMessage,
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: onRefresh,
          child: Text(context.localizations.refresh),
        ),
      ],
    );
  }
}
