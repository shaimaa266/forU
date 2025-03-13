import 'package:flutter/material.dart';
import 'package:untitled1/core/shared/customSnackBar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(BuildContext context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        customSnackBar(context, 'Cannot launch $url');
      }
    }
  } else {
    customSnackBar(context, 'URL is null');
  }
}
