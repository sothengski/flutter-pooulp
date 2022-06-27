import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

import '../core.dart';

enum LauncherType { email, phone, sms, web }

Future urlLauncherUtils({
  required String? thingToLaunch,
  LauncherType? laucherType = LauncherType.web,
  String? emailSubject = '',
  String? emailBodyMessage = '',
  bool? inApp = false,
}) async {
  String thingWillLaunch = '';

  if (laucherType == LauncherType.web) {
    try {
      if (await canLaunch(thingToLaunch.toString())) {
        await launch(
          thingToLaunch.toString(),
          forceSafariVC: inApp, //iOS
          forceWebView: inApp!, //Android
          enableJavaScript: true, //Android
        );
      } else {
        customSnackbar(
          msgTitle: 'Unable to launch',
          msgContent: '',
          bgColor: ColorsManager.red,
        );
      }
    } catch (e) {
      throw 'Could not lauch $e';
    }
  } else {
    if (laucherType == LauncherType.phone) {
      final Uri launchUri = Uri(
        // scheme: Platform.isIOS ? "tel://" : "tel:",
        scheme: 'tel',
        path: thingToLaunch,
      );
      thingWillLaunch =
          "${Platform.isIOS ? "tel://" : "tel:"}${launchUri.path}";
      // thingWillLaunch = 'tel://$thingToLaunch';

      // await _urlLauncher(url: launchUri.toString());
    } else if (laucherType == LauncherType.email) {
      String? encodeQueryParameters(Map<String, String> params) {
        return params.entries
            .map(
              (e) =>
                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
            )
            .join('&');
      }

      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: thingToLaunch,
        query: encodeQueryParameters(<String, String>{
          'subject': 'Example Subject & Symbols are allowed!'
        }),
      );
      thingWillLaunch = emailLaunchUri.toString();
      // await _urlLauncher(url: emailLaunchUri.toString());
    }
    if (laucherType == LauncherType.sms) {
      thingWillLaunch = 'sms:$thingToLaunch';
    }
    try {
      if (await canLaunch(thingWillLaunch)) {
        await launch(thingWillLaunch);
      } else {
        customSnackbar(
          msgTitle: 'Unable to launch',
          msgContent: '',
          bgColor: ColorsManager.red,
        );
      }
    } catch (e) {
      throw 'Could not lauch $e';
    }
  }
}
