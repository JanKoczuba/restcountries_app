import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/context_extension.dart';
import '../../resource/app_text_style.dart';
import 'section.dart';

class GoogleMapsLaunchBuilder extends StatelessWidget {
  const GoogleMapsLaunchBuilder({
    required this.url,
    Key? key,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Section(
      header: context.localizations.countryDetailsGoogleMaps,
      widget: InkWell(
        onTap: () async {
          if (Platform.isIOS) {
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.platformDefault,
            );
          } else {
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalNonBrowserApplication,
            );
          }
        },
        child: Text(
          context.localizations.countryDetailsOpenInGoogleMaps,
          style: AppTextStyle.countryDetailsGoogleMapsLauncher,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
