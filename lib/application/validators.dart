import 'package:flutter/widgets.dart';

import '../../../utils/context_extension.dart';
import '../utils/string_extension.dart';

typedef ValidatorFunction = String? Function(String?);

abstract class Validators {
  static ValidatorFunction notEmpty(BuildContext context) {
    return (value) {
      if (value == null || value.isEmpty) {
        return context.localizations.validationFieldIsRequired;
      }
      return null;
    };
  }

  static ValidatorFunction validEmail(BuildContext context) {
    return (value) {
      if (value != null && value.isNotEmpty && !value.isValidEmail()) {
        return context.localizations.validationFieldIsInvalidEmail;
      }
      return null;
    };
  }
}
