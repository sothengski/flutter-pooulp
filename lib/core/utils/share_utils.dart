import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future shareUtils({
  required BuildContext context,
  required String? text,
  String? urlPreview = '',
  // String? urlPreviewBody = '',
  bool? inApp = false,
}) async {
  final box = context.findRenderObject() as RenderBox?;

  String thingWillShare = '';
  thingWillShare = (urlPreview != '') ? '$text\n$urlPreview' : text!;

  return Share.share(
    thingWillShare,
    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  );
}
