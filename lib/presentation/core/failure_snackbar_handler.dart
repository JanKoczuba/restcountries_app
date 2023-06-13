import 'package:flutter/material.dart';

import '../../domain/core/failure.dart';
import '../../utils/context_extension.dart';
import '../../utils/safe_print.dart';

class FailureSnackBarHandler {
  static Future<void> handleFailure({
    required BuildContext context,
    required Failure failure,
    String? Function(Failure failure)? customHandler,
  }) async {
    final message = customHandler?.call(failure) ??
        failure.mapOrNull(
          serverConnectionFailure: (value) =>
              context.localizations.messageServerConnectionFailed,
          invalidResponse: (value) =>
              context.localizations.messageServerInvalidResponse,
          unknown: (value) =>
              context.localizations.messageUnexpectedErrorOccurred,
          badRequest: (value) =>
              value.message ?? context.localizations.messageServerBadRequest,
        );

    if (message == null) {
      safePrint("Not handled message for failure: $failure");
      return;
    }

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );

    await (ScaffoldMessenger.of(context)..removeCurrentSnackBar())
        .showSnackBar(snackBar)
        .closed;
  }
}
