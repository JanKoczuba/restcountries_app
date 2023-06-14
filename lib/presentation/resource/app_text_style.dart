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
    color: AppColor.countryName,
    fontWeight: FontWeight.w800,
  );

  static const countryCapital = TextStyle(
    fontSize: 16,
    color: AppColor.countryBody,
    fontWeight: FontWeight.w600,
  );

  static const countryDetailsFullName = TextStyle(
    fontSize: 24,
    color: AppColor.countryDetailsName,
    fontWeight: FontWeight.w600,
  );

  static const countryDetailsBody = TextStyle(
    fontSize: 20,
    color: AppColor.countryDetailsPopulation,
    fontWeight: FontWeight.w800,
  );


  static const countryDetailsHeader = TextStyle(
    fontSize: 16,
    color: AppColor.countryDetailsHeader,
    fontWeight: FontWeight.w600,
  );
  static const countryDetailsGoogleMapsLauncher = TextStyle(
    fontSize: 20,
    color: AppColor.countryDetailsUrlLauncher,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic
  );
}
