import 'package:flutter/material.dart';

import 'app_color.dart';

abstract class AppTextStyle {
  static const baseButton = TextStyle(
    fontSize: 24,
    color: AppColor.white,
    fontWeight: FontWeight.w800,
  );

  static const countryHeader = TextStyle(
    fontSize: 16,
    color: AppColor.accent,
    fontWeight: FontWeight.w600,
  );

  static const countryName = TextStyle(
    fontSize: 20,
    color: AppColor.commentName,
    fontWeight: FontWeight.w800,
  );

  static const countryCapital = TextStyle(
    fontSize: 16,
    color: AppColor.commentBody,
    fontWeight: FontWeight.w600,
  );
}
