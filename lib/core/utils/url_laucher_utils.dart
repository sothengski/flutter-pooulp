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
  late Uri thingWillLaunch;

  if (laucherType == LauncherType.web) {
    final web = Uri.parse(
      thingToLaunch.toString(),
      // 'https://google.com/',
    );
    if (await canLaunchUrl(web)) {
      launchUrl(web);
    } else {
      customSnackbar(
        msgTitle: 'Unable to launch',
        msgContent: '',
        bgColor: ColorsManager.red,
      );
      throw 'Could not launch $web';
    }
    // try {
    //   if (await canLaunch(thingToLaunch.toString())) {
    //     await launch(
    //       thingToLaunch.toString(),
    //       forceSafariVC: inApp, //iOS
    //       forceWebView: inApp!, //Android
    //       enableJavaScript: true, //Android
    //     );
    //   } else {
    //     customSnackbar(
    //       msgTitle: 'Unable to launch',
    //       msgContent: '',
    //       bgColor: ColorsManager.red,
    //     );
    //   }
    // } catch (e) {
    //   throw 'Could not lauch $e';
    // }
  } else {
    if (laucherType == LauncherType.phone) {
      final String prefix = Platform.isIOS ? "tel://" : "tel:";
      final call =
          // Uri.parse('tel:$thingToLaunch');
          Uri.parse('$prefix$thingToLaunch');
      // if (await canLaunchUrl(call)) {
      //   launchUrl(call);
      // } else {
      //   throw 'Could not launch $call';
      // }
      // final Uri launchUri = Uri(
      //   // scheme: Platform.isIOS ? "tel://" : "tel:",
      //   scheme: 'tel',
      //   path: thingToLaunch,
      // );
      // thingWillLaunch =
      //     "${Platform.isIOS ? "tel://" : "tel:"}${launchUri.path}";
      thingWillLaunch = call;

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

      final email = Uri(
        scheme: 'mailto',
        // path: 'codoweb.tech@gmail.com',
        // query: 'subject=App Feedback&body=App Version 3.23'//'subject=Hello&body=Test',
        path: thingToLaunch,
        query: encodeQueryParameters(
          <String, String>{'subject': '$emailSubject', 'body': ''},
        ),
      );
      // if (await canLaunchUrl(email)) {
      //   launchUrl(email);
      // } else {
      //   throw 'Could not launch $email';
      // }
      //  final Uri emailLaunchUri = Uri(
      //   scheme: 'mailto',
      //   path: thingToLaunch,
      //   query:
      //       encodeQueryParameters(<String, String>{'subject': '$emailSubject'}),
      // );
      thingWillLaunch = email;
      // await _urlLauncher(url: emailLaunchUri.toString());
    }
    if (laucherType == LauncherType.sms) {
      final sms = Uri.parse('sms:$thingToLaunch');
      // if (await canLaunchUrl(sms)) {
      //   launchUrl(sms);
      // } else {
      //   throw 'Could not launch $sms';
      // }
      thingWillLaunch = sms;
    }
    try {
      if (await canLaunchUrl(thingWillLaunch)) {
        launchUrl(thingWillLaunch);
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
